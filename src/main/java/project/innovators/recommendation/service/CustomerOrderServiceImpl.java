package project.innovators.recommendation.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import project.innovators.recommendation.dao.ICustomerOrderDao;
import project.innovators.recommendation.model.CustomerOrder;
import project.innovators.recommendation.model.User;

import java.util.List;

@Service
public class CustomerOrderServiceImpl implements ICustomerOrderService {

    @Autowired
    private ICustomerOrderDao customerOrderDao;

    @Override
    public void saveCustomerOrder(CustomerOrder customerOrder) {
        customerOrderDao.save(customerOrder);
    }

    @Override
    public CustomerOrder findById(Long coId) {
        return customerOrderDao.findCustomerOrderById(coId);
    }

    @Override
    public List<CustomerOrder> findByCustomer(User customer) {
        List<CustomerOrder> customerOrderList = null;
        try {
            customerOrderList = customerOrderDao.findByCustomer(customer);
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }

        return customerOrderList;


    }
}
