package project.innovators.recommendation.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;
import project.innovators.recommendation.model.Address;
import project.innovators.recommendation.model.User;

import java.sql.ResultSet;
import java.sql.SQLException;

@Repository("jdbcUserDao")
public class JdbcUserDaoImpl implements IJdbcUserDao {

    @Autowired
    JdbcTemplate jdbcTemplate;

    @Override
    public Long saveUser(User user) {

        System.out.println(">>> Before USER CATEGORY Id");

        Integer user_category_id = jdbcTemplate.queryForObject("select id from user_category where user_type = ?",
                new Object[] {user.getUserCategory().getUserType()}, Integer.class);

        saveUserAddress(user.getAddress());

        System.out.println(">>> Before Address Id: ");

        Address address = user.getAddress();
        Integer address_id = jdbcTemplate.queryForObject("select id from addresses where apt_number = ? and " +
                "city = ? and state = ? and street = ? and zip = ?", new Object[] { address.getAptNumber(),
                address.getCity(), address.getState(), address.getStreet(), address.getZip()}, Integer.class);


        System.out.println(">>> User Type id: " + user_category_id + " address_id: " + address_id);

        jdbcTemplate.update("INSERT INTO users (email, firstname, lastname, password, phone, address_id, user_category_id) " +
                "VALUES (?, ?, ?, ?, ?, ?, ?)", user.getEmail(), user.getFirstname(), user.getLastname(), user.getPassword(), user.getPhone(),
                address_id, user_category_id); // TODO: Don't set default usercategory as 2
        return 1L;
    }

    private void saveUserAddress(Address address) {
        jdbcTemplate.update("insert into addresses (apt_number, city, state, street, zip) " +
                "values(?,?,?,?,?)", address.getAptNumber(), address.getCity(), address.getState(), address.getStreet(), address.getZip());

    }
}

