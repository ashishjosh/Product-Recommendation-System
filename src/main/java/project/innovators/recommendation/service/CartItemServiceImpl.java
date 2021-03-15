package project.innovators.recommendation.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import project.innovators.recommendation.dao.ICartItemDao;
import project.innovators.recommendation.model.Cart;
import project.innovators.recommendation.model.CartItem;

import java.util.List;

@Service
public class CartItemServiceImpl implements ICartItemService {

    @Autowired
    private ICartItemDao cartItemDao;

    @Override
    public long addCartItem(CartItem cartItem) {
        try {
            cartItemDao.save(cartItem);
            return cartItem.getId();
        } catch (Exception e) {
            System.out.println(">>> Exception in CartItemServiceImpl#addCartItem: " + e.getMessage());
        }
        return -1;
    }

    @Override
    public long removeCartItem(CartItem cartItem) {
        return 0;
    }

    @Override
    public void save(CartItem cartItem) {
        cartItemDao.save(cartItem);
    }

    @Override
    public List<CartItem> findByCart(Cart cart) {
        return cartItemDao.findByCart(cart);
    }

    @Override
    public void deleteById(Long cartItemId) {
        cartItemDao.deleteById(cartItemId);
    }

    @Override
    public Integer updateQuantityForCartWithId(Long cartItemId, Integer quantity) {
        return cartItemDao.updateCartForCartWithId(cartItemId, quantity);
    }

    @Override
    public CartItem findById(Long id) {
        return cartItemDao.findCartItemById(id);
    }
}
