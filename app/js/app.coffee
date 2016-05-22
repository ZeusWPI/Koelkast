React      = require 'react'
{ render } = require 'react-dom'
{ IndexRoute, Router, Route, browserHistory } = require 'react-router'
{ combineReducers, createStore } = require 'redux'
{ Provider } = require 'react-redux'
$            = require 'jquery'
{ SET_USERS, SET_PRODUCTS, SET_BARCODES }    = require './constants/action_types'
{ syncHistoryWithStore, routerReducer } = require 'react-router-redux'

Layout   = require './components/layout/layout'
Users    = require './components/users/users'
Products = require './components/products/products'
Order    = require './components/order/order'

# STORE

barcodes     = require './reducers/barcodes'
currentOrder = require './reducers/current_order'
products     = require './reducers/products'
selectUser   = require './reducers/select_user'
status       = require './reducers/status'
users        = require './reducers/users'
reducer      = combineReducers({ barcodes, selectUser, users, products, status, currentOrder, routing: routerReducer})

store = createStore(reducer)
history = syncHistoryWithStore(browserHistory, store)

# RENDER PAGE

render(
  React.createElement Provider, store: store,
    React.createElement Router, history: history,
        React.createElement Route, path: "/", component: Layout,
          React.createElement IndexRoute, component: Users
          React.createElement Route, path: 'products', component: Products
          React.createElement Route, path: 'order/:user_id', component: Order
  document.getElementById 'content'
)

# LOAD USERS

usersUrl = "http://localhost:3000/users.json"
$.ajax
  url: usersUrl
  dataType: 'json'
  type: 'GET'
  success:( (data) ->
    store.dispatch {
      type: SET_USERS,
      users: data
    }
  ).bind(@)
  error:( (xhr, status, err) ->
    console.error usersUrl, status, err.toString()
  ).bind(@)

# LOAD PRODUCTS

productsUrl = "http://localhost:3000/products.json"
$.ajax
  url: productsUrl
  dataType: 'json'
  type: 'GET'
  success:( (data) ->
    store.dispatch {
      type: SET_PRODUCTS,
      products: data
    }
  ).bind(@)
  error:( (xhr, status, err) ->
    console.error productsUrl, status, err.toString()
  ).bind(@)

# LOAD BARCODES

barcodesUrl = "http://localhost:3000/barcodes.json"
$.ajax
  url: barcodesUrl
  dataType: 'json'
  type: 'GET'
  success:( (data) ->
    store.dispatch {
      type: SET_BARCODES,
      barcodes: data
    }
  ).bind(@)
  error:( (xhr, status, err) ->
    console.error barcodesUrl, status, err.toString()
  ).bind(@)
