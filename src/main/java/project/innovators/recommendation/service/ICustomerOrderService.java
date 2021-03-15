package project.innovators.recommendation.service;

import project.innovators.recommendation.model.CustomerOrder;
import project.innovators.recommendation.model.User;

import java.util.List;

public interface ICustomerOrderService {

    void saveCustomerOrder(CustomerOrder customerOrder);

    CustomerOrder findById(Long coId);

    List<CustomerOrder> findByCustomer(User customer);
}
