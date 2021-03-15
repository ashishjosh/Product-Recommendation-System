package project.innovators.recommendation.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;
import project.innovators.recommendation.model.ProductRating;
import project.innovators.recommendation.model.User;

import java.util.List;
import java.util.Set;

@Repository
public interface IProductRatingDao extends JpaRepository<ProductRating, Long> {

    @Query("select DISTINCT pr.user from ProductRating pr")
    List<User> findDistinctUsers();

    Set<ProductRating> findByUser(User u);
}
