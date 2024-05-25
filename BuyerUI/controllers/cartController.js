const db = require('../db');

exports.addToCart = async (req, res) => {
    const { product_id, quantity } = req.body;
    const buyer_id = 1; // Assuming a logged-in user with user_id = 1
    const query = 'INSERT INTO cart (buyer_id, product_id, quantity) VALUES (?, ?, ?)';
    try {
        db.execute(query, [buyer_id, parseInt(product_id, 10), parseInt(quantity, 10)]);
        res.redirect('/');
      } catch (error) {
        console.error(error);
        res.status(500).send('Server error');
      }
};
