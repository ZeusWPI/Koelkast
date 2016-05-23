React      = require 'react'
{ render } = require 'react-dom'
{ IndexRoute, Router, Route, browserHistory } = require 'react-router'
{ combineReducers, createStore }              = require 'redux'
{ Provider } = require 'react-redux'
$            = require 'jquery'
{ syncHistoryWithStore, routerReducer } = require 'react-router-redux'

Layout   = require './components/layout/layout'
Users    = require './components/users/users'
Products = require './components/products/products'
Order    = require './components/order/order'

# STORE

barcodes     = require './reducers/barcodes'
currentOrder = require './reducers/current_order'
products     = require './reducers/products'
selectedUser = require './reducers/selected_user'
status       = require './reducers/status'
users        = require './reducers/users'
reducer      = combineReducers({ barcodes, selectedUser, users, products, status, currentOrder, routing: routerReducer})
{ fetchUsers, fetchProducts, fetchBarcodes } = require './actions/action_creators'

store   = createStore(reducer)
history = syncHistoryWithStore(browserHistory, store)

# RENDER PAGE

render(
  React.createElement Provider, store: store,
    React.createElement Router, history: history,
        React.createElement Route, path: '/', component: Layout,
          React.createElement IndexRoute, component: Users
          React.createElement Route, path: 'products', component: Products
          React.createElement Route, path: 'order/:user_id', component: Order
  document.getElementById 'content'
)

# LOAD INITIAL DATA

fetchUsers().then (result) -> store.dispatch result
fetchProducts().then (result) -> store.dispatch result
fetchBarcodes().then (result) -> store.dispatch result
