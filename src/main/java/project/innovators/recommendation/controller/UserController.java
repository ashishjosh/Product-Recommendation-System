package project.innovators.recommendation.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import project.innovators.recommendation.algorithm.InputData;
import project.innovators.recommendation.algorithm.SlopeOne;
import project.innovators.recommendation.model.*;
import project.innovators.recommendation.service.ICartService;
import project.innovators.recommendation.service.IProductService;
import project.innovators.recommendation.service.IUserService;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.logging.Logger;

@Controller
public class UserController {

    private static Logger logger = Logger.getLogger("UserController");

    @Autowired
    private IUserService userService;

    @Autowired
    private IProductService productService;

    @Autowired
    private ICartService cartService;


    @Autowired
    InputData inputData;

    @Autowired
    SlopeOne slopeOne;


    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String login(HttpSession session) {
        if (session.getAttribute("user") == null) return "login";
        return "redirect:/";
    }

    @RequestMapping(value = "/login", method = RequestMethod.POST)
    public String loginUser(@RequestParam("email") String email, @RequestParam("password") String password,
                        HttpSession session, RedirectAttributes redirectAttributes) {

        logger.info(">>> INSIDE POST: login!!!");
        User user = null;
        try {
            // Will throw error if login is not successful
            user = userService.getUser(email, password);
            if (user == null) {
                // failed
                redirectAttributes.addFlashAttribute("error", "user==null Flash Attribute");
                return "redirect:login";
            } else {
                session.setAttribute("user", user);

                if (user.getUserCategory().getUserType().equalsIgnoreCase("customer")) {
                    session.setAttribute("customer", user);
                }

                // TODO: Refactor to move cart elsewhere
                // if cart for a user already exists, load it. else create new cart
                // select cart from carts where user_id = current_user.id
                List<Cart> cartList = userService.findCartForUser(user);

                Cart cart = null;
                for (Cart c : cartList) {
                    if (!c.isOrderPlaced()) {
                        cart = c;
                        System.out.println(">>> Found a cart with order not placed!");
                    }
                }

                if (cart == null){ // did not find a cart
                    cart = createCartForUser(user);
                    cartService.saveCartToDb(cart);
                } else {
                    System.out.println(">>> Found Cart for user: " + user.getEmail());
                }
                session.setAttribute("cart", cart);

                System.out.println(">>> Saved cart to DATABASE!!!" + cart.getId());


                // Start recommendation algorithm here
                initRecommenderAlgorithm();

                return "redirect:/"; // After successful login go to root
            }
        } catch (Exception e) {
            // FAIL to LOGIN. Add error message to the model to display it in the view
            redirectAttributes.addFlashAttribute("error", "Cannot Login. Please try again! (USING RedirectAttributes)");
            System.out.println(">>> " + e.getMessage());
            System.out.println(">>> Error Model: " + redirectAttributes.getFlashAttributes());
            return "redirect:login";
        }
    }

    private void initRecommenderAlgorithm() {
        slopeOne.slopeOne();
    }

    private Cart createCartForUser(User user) {

        System.out.println(">>> Creating cart for user...............");
        Cart cart = new Cart();
        cart.setCustomer(user);
        cart.setGrandTotal(0);
        cart.setOrderPlaced(false);
        return cart;
    }

    @RequestMapping("/logout")
    public String logoutAdmin(HttpSession session, Model model) {
        User user = (User)session.getAttribute("user");
        System.out.println(">>> Logging out as user " + user.getEmail());
        session.removeAttribute("user");
        model.addAttribute("logout", ">>> Logging out as user" + user.getEmail());
        return "home";
    }

    @GetMapping(value = "/signup")
    public String signup() {
        return "signup";
    }

    @PostMapping("/signup")
    public String signupUser(@ModelAttribute("user") User user,
                             @ModelAttribute("address")Address address,
                             @ModelAttribute("userType")UserCategory userCategory,
                             BindingResult bindingResult) {
        if (bindingResult.hasErrors()) {
            return "signup";
        }
        System.out.println(">>> Handling Signup post request");
        System.out.println(">>> UserCategory " + userCategory);
        System.out.println(">>> Address " + address);
        System.out.println(">>> User " + user);
        // set user address and category before saving
        user.setAddress(address);
        user.setUserCategory(userCategory);

        userService.save(user);

        User savedUser = userService.getUser(user.getEmail(), user.getPassword());

        if (savedUser.getId() < 0) {
            System.out.println(">>> User was not saved! " + user);
            return "signup";
        }

        return "redirect:/login";
    }

    @GetMapping("/seller/{sellerId}/all_products")
    public String sellerProducts(@PathVariable("sellerId") Long id, Model model) {

        List<ProductCategory> sellerProductCategories = userService.getProductCategoriesBySeller(id);
        System.out.println(">>> Got product categories belonging to seller " + sellerProductCategories);
        model.addAttribute("sellerProductCategories", sellerProductCategories);
        return "seller_products";
    }

    @GetMapping("/seller/add_product")
    public String addProduct(Model model, HttpSession session) {
        User user = (User) session.getAttribute("user");
        if (user.getUserCategory().getUserType().equals("seller")) {
            model.addAttribute("products", productService.getProducts());
            return "seller_add_product";
        }
        return "redirect:/";
    }

    @PostMapping("/seller/add_product")
    public String addProductToDatabase(@ModelAttribute("product") Product product,
                                       @ModelAttribute("product_category") ProductCategory category,
                                       @ModelAttribute("product_brand") ProductBrand brand,
                                       RedirectAttributes flash) {

        System.out.println(">>> " + product + "\n" + category + "\n" + brand);
        product.setProductBrand(brand);
        product.setProductCategory(category);
        System.out.println(">>> " + product);
        int savedToDb = productService.saveProductUploadedBySeller(product);
        if (savedToDb > 0) {//return primary key
            System.out.println(">>> Product uploaded to db");
            flash.addFlashAttribute("uploadMessage", "added product to database");
        } else {
            flash.addFlashAttribute("uploadMessage", "Failed to upload product to database");
        }
        return "redirect:/seller/add_product";
    }

    @RequestMapping(value = "/order-history", method = RequestMethod.GET)
    public String orderHistory(Model model, HttpSession session) {
        List<CustomerOrder> customerOrderList = userService.getCustomerOrders((User)session.getAttribute("user"));
        model.addAttribute("customerOrderList", customerOrderList);
        return "order_history";
    }


}
