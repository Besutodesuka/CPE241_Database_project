const db = require('../db');

exports.login = async (req, res) => {
    const username = req.body.username;
    const password = req.body.password;
     
    if (username && password) {
        try {
            const [rows] = await db.execute('SELECT * FROM user_info WHERE username = ? AND user_password = ? AND user_role = "buyer"', [username, password]);
            if (rows.length > 0) {
                req.session.loggedin = true;
                req.session.user_id = rows[0].user_id;
                res.redirect('/home');
            } else {
                res.send('Incorrect Username and/or Password!');
            }
       
          } catch (error) {
            console.error(error);
            res.status(500).send(error);
        }
    } else {
        res.send('Please enter Username and Password!');
    }
};

exports.getLoginPage = (req, res) => {
    res.render('login');
};
