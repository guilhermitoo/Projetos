const express = require('express');
const CategoryController = require('./controllers/CategoryController');
const BillsController = require('./controllers/BillsController');
const MovesController = require('./controllers/MovesController');
const EstimatesController = require('./controllers/EstimatesController');
const routes = express.Router();

routes.post('/category', CategoryController.create);
routes.get('/categories', CategoryController.index);

routes.post('/bill', BillsController.create);
routes.delete('/bill', BillsController.delete);
routes.get('/bills', BillsController.index);

routes.post('/move', MovesController.create);
routes.get('/moves', MovesController.index);

routes.post('/estimate', EstimatesController.create);
routes.get('/estimates', EstimatesController.index);

module.exports = routes;