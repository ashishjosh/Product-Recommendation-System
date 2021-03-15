package project.innovators.recommendation.algorithm;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import project.innovators.recommendation.dao.IProductDao;
import project.innovators.recommendation.dao.IProductRatingDao;
import project.innovators.recommendation.dao.IUserDao;
import project.innovators.recommendation.model.Product;
import project.innovators.recommendation.model.ProductRating;
import project.innovators.recommendation.model.User;

import java.util.*;

@Component
public class InputData {

    Map<User, HashMap<Product, Double>> data = new HashMap<>();
    List<Product> products;

    @Autowired
    private IProductRatingDao productRatingDao;

    @Autowired
    private IProductDao productDao;

    public Map<User, HashMap<Product, Double>> initializeData() {

        products = productDao.findAll(); // all the products in the db
//        int numProducts = products.size();
//        List<ProductRating> productRatingList = productRatingDao.findAll(); // get all ratings from db
////        numberOfUsers = productRatings.size();
//
//        // get all customers
//        numberOfUsers = customerList.size();

        List<User> customerList = productRatingDao.findDistinctUsers();
        HashMap<Product, Double> userRatingMap;

        for (User u : customerList) {
            userRatingMap = new HashMap<>();

            Set<ProductRating> productRatingsOfCurrentUser = productRatingDao.findByUser(u);

            for (ProductRating productRating: productRatingsOfCurrentUser) {
                userRatingMap.put(productRating.getProduct(), (double)productRating.getRating());
            }
            data.put(u, userRatingMap);
        }

        System.out.println("Input data: " + data);
        return data;
    }

    public Map<User, HashMap<Product, Double>> getData() {
        return data;
    }

    public void setData(Map<User, HashMap<Product, Double>> data) {
        this.data = data;
    }

    public List<Product> getProducts() {
        return products;
    }

    public void setProducts(List<Product> products) {
        this.products = products;
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append("InputData: ");
        for (HashMap<Product, Double> user: data.values()) {
            sb.append("  :  " + user.keySet());
        }
        return sb.toString();
    }
}