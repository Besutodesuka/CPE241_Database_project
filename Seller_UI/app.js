const express = require('express');
const bodyParser = require('body-parser');
const path = require('path');

const app = express();

// Set the view engine to EJS
app.set('view engine', 'ejs');
app.set('views', path.join(__dirname, 'views'));

// Serve static files from the public directory
app.use(express.static(path.join(__dirname, 'public')));

// Use body-parser middleware to parse form data
app.use(bodyParser.urlencoded({ extended: true }));

// Route to render the sign-up page
app.get('/', (req, res) => {
    res.render('signup');
});

// Handle form submission
app.post('/signup', (req, res) => {
    const { shopName, address, phone, email } = req.body;
    // You can now process the form data as needed
    console.log(req.body);

    // For now, just redirect to the home page
    res.redirect('/');
});

// Start the server
const PORT = process.env.PORT || 3002;
app.listen(PORT, () => {
    console.log(`Server is running on http://localhost:${PORT}`);
});