package project.innovators.recommendation.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;
import project.innovators.recommendation.model.Product;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

@Repository
public class JdbcProductDaoImpl {

    @Autowired
    private JdbcTemplate db;

    @Autowired
    private IProductDao productDao;


    public void saveUploadedProduct(Product product) {
        String categoryName = product.getProductCategory().getCategoryName();
        String brandName = product.getProductBrand().getBrandName();

        // 1. if category already in db extract the id. do the same for brand.
        // 2. if not in db, insert them both into the db. Can use hibernate for that.
        String checkcatsql = "select id from product_category where category_name = ?";
        String checkbrandsql = "select id from product_brand where brand_name = ?";
        try {
            long cat_id, brand_id;
            ArrayList<Integer> catIdList = (ArrayList<Integer>) db.query(checkcatsql, new Object[]{categoryName}, new RowMapper() {
                @Override
                public Object mapRow(ResultSet resultSet, int i) throws SQLException {
                    return resultSet.getInt("id");
                }
            });


            ArrayList<Integer> brandIdList = (ArrayList<Integer>) db.query(checkbrandsql, new Object[]{brandName}, (RowMapper) (resultSet, i) -> resultSet.getInt("id"));

            if (catIdList.isEmpty())
                cat_id = -1;
            else cat_id = catIdList.get(0);

            if (brandIdList.isEmpty())
                brand_id = -1;
            else brand_id = brandIdList.get(0);

            // both cateory and brand already exist
            if (cat_id > 0 && brand_id > 0) {
                String insertsql = "insert into products(description, image_url, price, product_category_id, product_brand_id) " +
                        "VALUES (?, ?, ?, ?, ?)";
                db.update(insertsql, product.getDescription(), product.getImageUrl(), product.getPrice(), cat_id, brand_id);
            }
            else if (cat_id > 0) {
                // insert brand first
                System.out.println(">>> Cat_id: " + cat_id + " ||| brand_id: " + brand_id);

                db.update("insert into product_brand (brand_name) VALUES (?)", brandName);

                String insertsql = "insert into products(description, image_url, price, product_category_id, product_brand_id) " +
                        "VALUES (?, ?, ?, ?, (select id from product_brand where brand_name = ?))";
                db.update(insertsql, product.getDescription(), product.getImageUrl(), product.getPrice(), cat_id, brandName);
            } else if (brand_id > 0){ // cat not in db; only brand

                System.out.println(">>> Cat_id: " + cat_id + " ||| brand_id: " + brand_id);

                db.update("insert into product_category (category_name) VALUES (?)", categoryName);

                String insertsql = "insert into products(description, image_url, price, product_category_id, product_brand_id) " +
                        "VALUES (?, ?, ?,, ?)";
                db.update(insertsql, product.getDescription(), product.getImageUrl(), product.getPrice(), categoryName, brand_id);
            } else { // none of them in db
                System.out.println(">>> Using HIbernate#save method to insert");
                productDao.save(product);
            }
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println(">>> In JdbcProductDao#saveUploadedProduct: " + e.getMessage());
        }
    }
}
