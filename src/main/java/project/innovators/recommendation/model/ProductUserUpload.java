package project.innovators.recommendation.model;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Objects;

@Embeddable
class ProductUserUploadKey implements Serializable {
    Long pid;
    Long uid;

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        ProductUserUploadKey that = (ProductUserUploadKey) o;
        return Objects.equals(pid, that.pid) &&
                Objects.equals(uid, that.uid);
    }

    @Override
    public int hashCode() {
        return Objects.hash(pid, uid);
    }
}

@Entity
@Table(name = "product_user")
public class ProductUserUpload {

    @EmbeddedId
    ProductUserUploadKey id;

    @OneToOne
    @MapsId("pid")
    @JoinColumn(name = "pid")
    Product product;

    @ManyToOne
    @MapsId("uid")
    @JoinColumn(name = "uid")
    User user;

    public ProductUserUpload() {
    }

    public ProductUserUploadKey getId() {
        return id;
    }

    public void setId(ProductUserUploadKey id) {
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
}
