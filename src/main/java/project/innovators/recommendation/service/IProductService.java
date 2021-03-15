package project.innovators.recommendation.service;

import org.springframework.data.domain.Page;
import org.springframework.stereotype.Service;
import project.innovators.recommendation.model.Product;
import project.innovators.recommendation.model.ProductCategory;

import java.util.List;
import java.util.Set;

public interface IProductService {

    List<Product> findByProductCategory(String prod_category);

    Set<ProductCategory> getCategoriesForExistingProducts();

    Product findById(long id);

    int saveProductUploadedBySeller(Product product);

    List<Product> getProducts();


    Page<Product> getProductByName(String productName, Integer pageNo, Integer pageSize, String sortBy);

    void saveRating(Long id, Long productId, Integer rating);
}
