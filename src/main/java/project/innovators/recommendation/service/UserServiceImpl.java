package project.innovators.recommendation.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import project.innovators.recommendation.dao.ICartDao;
import project.innovators.recommendation.dao.ICustomerOrderDao;
import project.innovators.recommendation.dao.IJdbcUserDao;
import project.innovators.recommendation.dao.IUserDao;
import project.innovators.recommendation.model.Cart;
import project.innovators.recommendation.model.CustomerOrder;
import project.innovators.recommendation.model.ProductCategory;
import project.innovators.recommendation.model.User;

import javax.transaction.Transactional;
import java.math.BigInteger;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Logger;

@Service
public class UserServiceImpl implements IUserService {

    private static Logger logger = Logger.getLogger("AdminServiceImpl");
    @Autowired
    private IUserDao userDao;

    @Autowired
    private IJdbcUserDao jdbcUserDao;

    @Autowired
    private ICartDao cartDao;

    @Autowired
    private ICustomerOrderDao customerOrderDao;

    @Transactional
    public User getUser(String email, String password) {
        logger.info(">>>> Running userService#getUser query");
        return  userDao.findByEmailAndPassword(email, password);
    }

    @Override
    public void save(User user) {
        logger.info(">>>> Running userService#save query");
        jdbcUserDao.saveUser(user);
        //userDao.save(user);
    }

    @Override
    public List<ProductCategory> getProductCategoriesBySeller(Long id) {
        List<ProductCategory> productCategories = new ArrayList<>();
        List<Object[]> prodObjects = userDao.getProductCategoriesBySeller(id);
//        prodObjects.stream().forEach(prodObject -> productCategories.add((ProductCategory) prodObject));
        for (Object[] objects : prodObjects) {
            long pc_id = ((BigInteger)objects[0]).longValue();
            String pc_name = (String)objects[1];
            productCategories.add(new ProductCategory(pc_id, pc_name));
        }
        return productCategories;
    }

    @Override
    public List<Cart> findCartForUser(User user) {
        return cartDao.findCartByCustomer(user);
    }

    @Override
    public List<CustomerOrder> getCustomerOrders(User customer) {
        return customerOrderDao.getCustomerOrderByCustomer(customer);

    }
}
