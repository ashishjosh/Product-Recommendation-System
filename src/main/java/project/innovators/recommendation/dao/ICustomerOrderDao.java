package project.innovators.recommendation.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import project.innovators.recommendation.model.CustomerOrder;
import project.innovators.recommendation.model.User;

import java.util.List;

@Repository
public interface ICustomerOrderDao extends JpaRepository<CustomerOrder, Long> {
    CustomerOrder findCustomerOrderById(Long customerOrderId);

    List<CustomerOrder> getCustomerOrderByCustomer(User customer);

    List<CustomerOrder> findByCustomer(User customer);
}
