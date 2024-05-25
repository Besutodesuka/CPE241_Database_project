const db = require('../db');

exports.homePage = async (req, res) => {
  try {
    // if (searchQuery == ''){
    //   const [rows] = await db.execute('SELECT * FROM PRODUCT_INFO');
    // }else{
    //   const [rows] = await db.execute('SELECT * FROM PRODUCT_INFO WHERE product_name LIKE ?', [`%${searchQuery}%`]);
    // }
    const [rows] = await db.execute('SELECT * FROM product');
    res.render('index', { products: rows });
  } catch (error) {
    console.error(error);
    res.status(500).send('Server error');
  }
};

exports.searchProducts = async (req, res) => {
  const searchQuery = req.query.q || '';
  try {
    const [rows] = await db.execute('SELECT * FROM product WHERE product_name LIKE ?', [`%${searchQuery}%`]);
    res.render('search', { products: rows });
  } catch (error) {
    console.error(error);
    res.status(500).send('Server error');
  }
};

exports.getProductById = async (req, res) => {
  console.log(`Fetching product with ID: ${req.params.id}`);
  const query = 'SELECT * FROM product WHERE product_id = ?';
  const searchQuery =  parseInt(req.params.id, 10) || '';
  try {
    const [rows] = await db.execute(query, [searchQuery]);
    console.log(`res: ${rows}`);
    res.render('product_view', { product: rows[0] });
  } catch (error) {
    console.error(error);
    res.status(500).send('Server error');
  }
};