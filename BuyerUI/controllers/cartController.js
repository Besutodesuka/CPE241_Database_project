const db = require('../db');

exports.addToCart = async (req, res) => {
    const { product_id, quantity } = req.body;
    const buyer_id = req.session.user_id;// Assuming a logged-in user with user_id = 1
    const query = 'INSERT INTO cart (buyer_id, product_id, quantity) VALUES (?, ?, ?)';
    try {
        db.execute(query, [buyer_id, parseInt(product_id, 10), parseInt(quantity, 10)]);
        res.redirect('/home');
      } catch (error) {
        console.error(error);
        res.status(500).send('Server error');
      }
};

exports.viewCart = async (req, res) => {
  const buyerId = req.session.user_id; // Assuming req.user contains authenticated user's information

  const query = `
    SELECT cart.cart_id, cart.quantity, product.product_id, product.product_name, product.price FROM cart
    INNER JOIN product ON cart.product_id = product.product_id 
    WHERE cart.buyer_id = ?;
  `;

  try {
    const [results] = await db.execute(query, [buyerId]);

    const cartItems = results.map(row => ({
      id: row.cart_id,
      productId: row.product_id,
      name: row.product_name,
      price: row.price,
      quantity: row.quantity,
      image: row.image || '/path/to/default-image.png' // Assuming a default image path
    }));

    const totalPrice = cartItems.reduce((total, item) => total + item.price * item.quantity, 0);

    res.render('cart', { cartItems, totalPrice });
  } catch (err) {
    console.error(err);
    res.status(500).send('Internal Server Error');
  }
};

exports.updateCartItem = async (req, res) => {
  const { cart_id, quantity } = req.body;

  const query = `
    UPDATE cart
    SET quantity = ?
    WHERE cart_id = ?;
  `;

  try {
    await db.execute(query, [quantity, cart_id]);
    res.send('Cart item updated');
  } catch (err) {
    console.error(err);
    res.status(500).send('Internal Server Error');
  }
};

exports.removeCartItem = async (req, res) => {
  const { cart_id } = req.body;

  const query = `
    DELETE FROM cart
    WHERE cart_id = ?;
  `;

  try {
    await db.execute(query, [cart_id]);
    res.send('Cart item removed');
  } catch (err) {
    console.error(err);
    res.status(500).send('Internal Server Error');
  }
};
