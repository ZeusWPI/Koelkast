React      = require 'react'
{ render } = require 'react-dom'
{ IndexRoute, Router, Route, browserHistory } = require 'react-router'
{ combineReducers, createStore } = require 'redux'
{ Provider } = require 'react-redux'
$            = require 'jquery'
{ SET_USERS, SET_PRODUCTS }    = require './constants/action_types'
{ syncHistoryWithStore, routerReducer } = require 'react-router-redux'

Layout   = require './components/layout/layout'
Users    = require './components/users/users'
Products = require './components/products/products'

# STORE

select_user = require './reducers/select_user'
users       = require './reducers/users'
products    = require './reducers/products'
reducer     = combineReducers({ select_user, users, products, routing: routerReducer})

store = createStore(reducer)
history = syncHistoryWithStore(browserHistory, store)

# RENDER PAGE

render(
  React.createElement Provider, store: store,
    React.createElement Router, history: history,
        React.createElement Route, path: "/", component: Layout,
          React.createElement IndexRoute, component: Users
          React.createElement Route, path: 'products', component: Products
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
