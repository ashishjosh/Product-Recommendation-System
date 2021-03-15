package project.innovators.recommendation.dao;

import project.innovators.recommendation.model.User;

public interface IJdbcUserDao {
    Long saveUser(User user);

}
