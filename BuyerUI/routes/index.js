const express = require('express');
const router = express.Router();
const productController = require('../controllers/productController');

router.get('/', productController.homePage);
router.get('/search', productController.searchProducts);

module.exports = router;