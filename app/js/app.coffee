React = require 'react'
{ IndexRoute, Router, Route, browserHistory } = require 'react-router'

# STORE

{ createStore, applyMiddleware }           = require 'redux'
{ syncHistoryWithStore, routerMiddleware } = require 'react-router-redux'
reducer                  = require './reducers/combine_reducer'

store   = createStore(reducer, applyMiddleware(routerMiddleware(browserHistory)))
history = syncHistoryWithStore(browserHistory, store)

# RENDER PAGE

{ render } = require 'react-dom'
{ Provider } = require 'react-redux'
Layout       = require './components/layout/layout'
Users        = require './components/users/users'
Products     = require './components/products/products'
Order        = require './components/order/order'

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

{ fetchUsers, fetchProducts, fetchBarcodes } = require './actions/action_creators'

fetchUsers()(store.dispatch)
fetchProducts()(store.dispatch)
fetchBarcodes()(store.dispatch)
