const db = require('../db');

exports.renderCheckoutPage = async (req, res) => {
  const userId = req.session.user_id;
  console.log(req.body);
  try {
    // Fetch addresses, delivery providers, and payment methods from the database
    const [addresses] = await db.execute('SELECT address_id, address FROM user_address WHERE user_id = ?', [userId]);
    const [deliveryProviders] = await db.execute('SELECT delivery_id, delivery_name FROM delivery_provider');
    const [paymentMethods] = await db.execute('SELECT card_type, bank_name, card_front_number FROM user_card WHERE user_id = ?', [userId]);

    // Fetch cart items
    const [cartItems] = await db.execute(`
      SELECT cart.cart_id, cart.quantity, product.product_id, product.product_name, product.price
      FROM cart
      INNER JOIN product ON cart.product_id = product.product_id
      WHERE cart.buyer_id = ?
    `, [userId]);

    // Calculate total price
    const totalPrice = cartItems.reduce((total, item) => total + item.price * item.quantity, 0);

    res.render('checkout', { addresses, deliveryProviders, paymentMethods, totalPrice});
  } catch (err) {
    console.error(err);
    res.status(500).send('Internal Server Error');
  }
};

exports.handleBuy = async (req, res) => {
  const { address_id, delivery_id, payment_method, total_price, items } = req.body;
  console.log(delivery_id);
  const userId = req.session.user_id;
  const connection = await db.getConnection();
  try {
      // console.log(req.body);
    await connection.beginTransaction();
    const [transactionResult] = await connection.execute(
      'INSERT INTO transaction (paid_amount, payment_method) VALUES (?, ?)',
      [parseFloat(total_price, 10), payment_method]
    );
    const transactionId = transactionResult.insertId;
    // Insert into orders table
    for (const item of JSON.parse(items)) {
      console.log(item)
      await connection.execute(
        'INSERT INTO orders (buyer_id, product_id, quantity, transaction_id, total_price, order_date, order_status, delivery_id) VALUES (?, ?, ?, ?, ?, NOW(), ?, ?)',
        [userId, parseInt(item.id, 10), parseInt(item.quantity, 10), parseInt(transactionId, 10), item.price, 'Pending', delivery_id]
      );
    }
    await connection.execute(
      'DELETE FROM cart WHERE buyer_id = ?', [userId]
    );
    await connection.commit();
    
    res.redirect('/home');
  } catch (err) {
    // Rollback transaction in case of error
    await connection.rollback();
    console.error(err);
    res.status(500).send('Internal Server Error');
  }
};
