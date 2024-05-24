const db = require('../db');

exports.homePage = async (req, res) => {
  try {
    // if (searchQuery == ''){
    //   const [rows] = await db.execute('SELECT * FROM PRODUCT_INFO');
    // }else{
    //   const [rows] = await db.execute('SELECT * FROM PRODUCT_INFO WHERE product_name LIKE ?', [`%${searchQuery}%`]);
    // }
    const [rows] = await db.execute('SELECT * FROM PRODUCT_INFO');
    res.render('index', { products: rows });
  } catch (error) {
    console.error(error);
    res.status(500).send('Server error');
  }
};

exports.searchProducts = async (req, res) => {
  const searchQuery = req.query.q || '';
  try {
    const [rows] = await db.execute('SELECT * FROM PRODUCT_INFO WHERE product_name LIKE ?', [`%${searchQuery}%`]);
    res.render('search', { products: rows });
  } catch (error) {
    console.error(error);
    res.status(500).send('Server error');
  }
};
