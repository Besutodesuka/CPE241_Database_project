const db = require('../db');

exports.homePage = async (req, res) => {
  // const categories = ["Category1", "Category2", "Category3", "Category4", "Category5"];
  // const products = [
  //   { name: "Product1", price: "$10" },
  //   { name: "Product2", price: "$20" },
  //   { name: "Product3", price: "$30" },
  //   { name: "Product4", price: "$40" },
  //   { name: "Product5", price: "$50" }
  // ];
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
    // if (searchQuery == ''){
    //   const [rows] = await db.execute('SELECT * FROM PRODUCT_INFO');
    // }else{
    //   const [rows] = await db.execute('SELECT * FROM PRODUCT_INFO WHERE product_name LIKE ?', [`%${searchQuery}%`]);
    // }
    const [rows] = await db.execute('SELECT * FROM PRODUCT_INFO WHERE product_name LIKE ?', [`%${searchQuery}%`]);
    res.render('search', { products: rows });
  } catch (error) {
    console.error(error);
    res.status(500).send('Server error');
  }
};
