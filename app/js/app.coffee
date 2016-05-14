React      = require 'react'
{ render } = require 'react-dom'
{ IndexRoute, Router, Route, browserHistory } = require 'react-router'
{ combineReducers, createStore } = require 'redux'
{ Provider } = require 'react-redux'
$            = require 'jquery'

Layout = require './components/layout/layout'
Users  = require './components/users/users'

# STORE

select_user = require './reducers/select_user'
users       = require './reducers/users'
reducer     = combineReducers({ select_user, users})

store = createStore(reducer)

# RENDER PAGE

render(
  React.createElement Provider, store: store,
    React.createElement Router, history: browserHistory,
        React.createElement Route, path: "/", component: Layout,
          React.createElement IndexRoute, component: Users
  document.getElementById 'content'
)

# LOAD USERS

url = "http://localhost:3000/users.json"
$.ajax
  url: url
  dataType: 'json'
  type: 'GET'
  success:( (data) ->
    store.dispatch {
      type: 'SET_USERS',
      users: data
    }
  ).bind(@)
  error:( (xhr, status, err) ->
    console.error url, status, err.toString()
  ).bind(@)
