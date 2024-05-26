const express = require('express');
const router = express.Router();
const productController = require('../controllers/productController');
const cartController = require('../controllers/cartController');
const userController = require('../controllers/userController');
const checkoutController = require('../controllers/checkoutController');


router.get('/', userController.getLoginPage);
router.post('/login', userController.login);

router.get('/home', productController.homePage);
router.get('/search', productController.searchProducts);
router.get('/product/:id', productController.getProductById);

router.post('/add-to-cart', cartController.addToCart);
router.get('/cart', cartController.viewCart);
router.post('/cart/update-cart-item', cartController.updateCartItem);
router.post('/cart/remove-cart-item', cartController.removeCartItem);

router.get('/cart/checkout', checkoutController.renderCheckoutPage);
router.post('/cart/buy', checkoutController.handleBuy);

module.exports = router;