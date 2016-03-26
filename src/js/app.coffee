React      = require('react')
{ render } = require('react-dom')
$          = require('jquery')

Users      = require('./components/users')

$ ->
  element = React.createElement(Users, url: 'http://localhost:3000/users.json')
  render(element, document.getElementById('content'))
