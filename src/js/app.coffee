React      = require 'react'
{ render } = require 'react-dom'
{ IndexRoute, Router, Route, browserHistory } = require 'react-router'
$          = require 'jquery'

Layout = require './components/layout/layout'
Start  = require './components/start/start'

$ ->
  render((
    React.createElement Router, history: browserHistory,
      React.createElement Route, path: "/", component: Layout,
        React.createElement IndexRoute, component: Start
  ), document.getElementById 'content')
