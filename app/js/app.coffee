React      = require 'react'
{ render } = require 'react-dom'
{ IndexRoute, Router, Route, browserHistory } = require 'react-router'
{ combineReducers, createStore } = require 'redux'
{ Provider } = require 'react-redux'
$            = require 'jquery'

Layout = require './components/layout/layout'
Users  = require './components/users/users'

select_user = require './reducers/select_user'
users = require './reducers/users'
reducer = combineReducers({ select_user, users})

store = createStore(reducer)

$.ajax
  url: "http://localhost:3000/users.json"
  dataType: 'json'
  type: 'GET'
  success:( (data) ->
    store.dispatch {
      type: 'SET_USERS',
      users: data
    }
  ).bind(@)
  error:( (xhr, status, err) ->
    console.error @props.url, status, err.toString()
  ).bind(@)

$ ->
  render(React.createElement(Provider, store: store, React.createElement(Users)), document.getElementById 'content')
