package project.innovators.recommendation.model;


import javax.persistence.*;
import javax.validation.constraints.Max;
import javax.validation.constraints.Min;
import java.io.Serializable;
import java.util.Objects;

@Embeddable
class ProductRatingKey implements Serializable {
    @Column(name = "user_id")
    Long userId;

    @Column(name = "product_id")
    Long productId;

    public ProductRatingKey() {
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        ProductRatingKey that = (ProductRatingKey) o;
        return userId.equals(that.userId) &&
                productId.equals(that.productId);
    }

    @Override
    public int hashCode() {
        return Objects.hash(userId, productId);
    }
}

@Entity
@Table(name = "product_rating")
public class ProductRating {

    @EmbeddedId
    ProductRatingKey id;

    @ManyToOne
    @MapsId("product_id")
    @JoinColumn(name = "product_id")
    Product product;

    @ManyToOne
    @MapsId("user_id")
    @JoinColumn(name = "user_id")
    User user;

    @Min(value = 0,  message = "The value must be positive") @Max(5)
    int rating;

    public ProductRating() {
    }

    public ProductRating(ProductRatingKey id, Product product, User user, int rating) {
        this.id = id;
        this.product = product;
        this.user = user;
        this.rating = rating;
    }

    public ProductRatingKey getId() {
        return id;
    }

    public void setId(ProductRatingKey id) {
        this.id = id;
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public int getRating() {
        return rating;
    }

    public void setRating(int rating) {
        this.rating = rating;
    }

    @Override
    public String toString() {
        return "ProductRating{" +
                "id=" + id +
                ", product=" + product.getId() +
                ", user=" + user.getId() +
                ", rating=" + rating +
                '}';
    }
}