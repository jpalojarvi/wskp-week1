'use strict';
const express = require('express');
const app = express();
const port = 3000;

app.set('views', './views');
app.set('view engine', 'pug');
app.use(express.static('public'));

app.get('/', (req, res) => {
  res.render('index');
});

app.get('/products', (req, res) => {
  res.render('products');
});

app.get('/catinfo', (req, res) => {
    const cat = {
      name: 'Frank',
      birthdate: '2010-12-25',
      weight: 6,
    };
    res.json(cat);
  });

app.listen(port, () => {
  console.log(`Example app listening at http://localhost:${port}`);
});