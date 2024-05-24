const db = require('../db');

exports.login = (req, res) => {
    const username = req.body.username;
    const password = req.body.password;

    if (username && password) {
        db.query('SELECT * FROM USER_INFO WHERE username = ? AND user_password = ? AND user_role = "admin"', [username, password], (err, results) => {
            if (err) throw err;
            if (results.length > 0) {
                req.session.loggedin = true;
                req.session.username = username;
                res.redirect('/home');
            } else {
                res.send('Incorrect Username and/or Password!');
            }
        });
    } else {
        res.send('Please enter Username and Password!');
    }
};

exports.getHomePage = (req, res) => {
    if (req.session.loggedin) {
        res.render('home', { username: req.session.username });
    } else {
        res.send('Please login to view this page!');
    }
};

exports.getLoginPage = (req, res) => {
    res.render('index');
};
