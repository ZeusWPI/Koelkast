{ combineReducers, createStore }        = require 'redux'
{ syncHistoryWithStore, routerReducer } = require 'react-router-redux'

barcodes     = require './../reducers/barcodes'
currentOrder = require './../reducers/current_order'
products     = require './../reducers/products'
selectedUser = require './../reducers/selected_user'
status       = require './../reducers/status'
users        = require './../reducers/users'

module.exports = combineReducers({
  barcodes,
  selectedUser,
  users, products,
  status,
  currentOrder,
  routing: routerReducer
})
