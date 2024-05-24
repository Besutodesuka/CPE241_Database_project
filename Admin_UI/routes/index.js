const express = require('express');
const router = express.Router();
const userController = require('../controllers/userController');

router.get('/', userController.getLoginPage);
router.post('/login', userController.login);
router.get('/home', userController.getHomePage);

module.exports = router;
