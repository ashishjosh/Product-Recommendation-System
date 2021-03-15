package project.innovators.recommendation.model;

import javax.persistence.*;

@Entity
@Table
public class CustomerOrder {

    @Id @GeneratedValue(strategy = GenerationType.IDENTITY)
    Long id;

    @OneToOne
    @JoinColumn(name = "user_id")
    User customer;

    @OneToOne
    @JoinColumn(name = "cart_id")
    Cart cart;

    public CustomerOrder() {
    }

    public CustomerOrder(Long id, User customer, Cart cart) {
        this.id = id;
        this.customer = customer;
        this.cart = cart;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public User getCustomer() {
        return customer;
    }

    public void setCustomer(User customer) {
        this.customer = customer;
    }

    public Cart getCart() {
        return cart;
    }

    public void setCart(Cart cart) {
        this.cart = cart;
    }

    @Override
    public String toString() {
        return "CustomerOrder{" +
                "id=" + id +
                ", customer=" + customer +
                ", cart=" + cart +
                '}';
    }
}

