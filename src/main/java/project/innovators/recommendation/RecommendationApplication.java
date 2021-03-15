package project.innovators.recommendation;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.jdbc.DataSourceAutoConfiguration;
import project.innovators.recommendation.dao.IProductRatingDao;

@SpringBootApplication//(exclude={DataSourceAutoConfiguration.class})
public class RecommendationApplication {


	public static void main(String[] args) {
		SpringApplication.run(RecommendationApplication.class, args);
	}

}
