package project.innovators.recommendation.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import project.innovators.recommendation.model.ProductCategory;
import project.innovators.recommendation.model.User;

import java.util.List;

@Repository
public interface IUserDao extends JpaRepository<User, Long> {

    //    @Query(value = "SELECT * FROM USERS WHERE EMAIL_ADDRESS = ?1", nativeQuery = true)
    User findByEmailAndPassword(String email, String password);

    //    @Query("SELECT pc FROM Product p INNER JOIN p.productCategory pc  ")
    @Query(value = "select pc.id, pc.name from product_category pc join products p on pc.id = p.product_category_id join product_user pu on pu.pid = p.id where pu.uid = :user_id", nativeQuery = true)
    List<Object[]> getProductCategoriesBySeller(@Param("user_id") Long id);

    @Query("select u from User u where u.userCategory.userType = 'customer'")
    List<User> getCustomers();

}


