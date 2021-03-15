package project.innovators.recommendation.model;

import javax.persistence.*;

@Entity
@Table(name="product_brand")
public class ProductBrand {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;

    @Column(name = "brand_name")
    private String brandName;

    public ProductBrand() {
    }

    public ProductBrand(long id, String brandName) {
        this.id = id;
        this.brandName = brandName;
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getBrandName() {
        return brandName;
    }

    public void setBrandName(String brandName) {
        this.brandName = brandName;
    }

    @Override
    public String toString() {
        return "ProductBrand{" +
                "id=" + id +
                ", brandName='" + brandName + '\'' +
                '}';
    }
}
