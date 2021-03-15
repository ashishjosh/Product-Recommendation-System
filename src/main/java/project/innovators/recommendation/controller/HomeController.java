package project.innovators.recommendation.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import project.innovators.recommendation.algorithm.InputData;
import project.innovators.recommendation.algorithm.SlopeOne;
import project.innovators.recommendation.dao.IProductRatingDao;
import project.innovators.recommendation.model.Product;
import project.innovators.recommendation.model.User;

import java.util.HashMap;
import java.util.Map;

@Controller
public class HomeController {

    @RequestMapping("/")
    public String home(Model model) {
        return "home";
    }
}
