const express = require('express');
const CategoryController = require('./controllers/CategoryController');
const BillsController = require('./controllers/BillsController');
const MovesController = require('./controllers/MovesController');
const EstimatesController = require('./controllers/EstimatesController');
const InvoicesControler = require('./controllers/InvoicesController');
const routes = express.Router();
  

routes.post('/category', CategoryController.create);
routes.get('/categories', CategoryController.index);

routes.post('/bill', BillsController.create);
routes.delete('/bill', BillsController.delete);
routes.get('/bills', BillsController.index);

routes.post('/move', MovesController.create);
routes.get('/moves', MovesController.index);
routes.get('/open', MovesController.open);
routes.get('/paid', MovesController.paid);

routes.post('/estimate', EstimatesController.create);
routes.get('/estimates', EstimatesController.index);

routes.post('/invoice', InvoicesControler.create);
routes.get('/invoices', InvoicesControler.index);

module.exports = routes;