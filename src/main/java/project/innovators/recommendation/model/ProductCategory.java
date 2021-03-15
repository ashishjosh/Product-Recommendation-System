package project.innovators.recommendation.model;

import javax.persistence.*;

@Entity
@Table(name = "product_category")
public class ProductCategory {

    @Id @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;

    private String categoryName;

//    @OneToMany//(mappedBy = "category")
//    private Set<Product> product = new HashSet<>();

    public ProductCategory() {}

    public ProductCategory(long id, String name) {
        this.id = id;
        this.categoryName = name;
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getCategoryName() {
        return categoryName;
    }

    public void setCategoryName(String categoryName) {
        this.categoryName = categoryName;
    }

    @Override
    public String toString() {
        return "ProductCategory{" +
                "id=" + id +
                ", name='" + categoryName + '\'' +
                '}';
    }
}
