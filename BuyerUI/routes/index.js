const express = require('express');
const router = express.Router();
const productController = require('../controllers/productController');
const cartController = require('../controllers/cartController');

router.get('/', productController.homePage);
router.get('/search', productController.searchProducts);
router.get('/product/:id', productController.getProductById);
router.post('/add-to-cart', cartController.addToCart);

module.exports = router;