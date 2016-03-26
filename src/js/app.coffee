React      = require('react')
{ render } = require('react-dom')
$          = require('jquery')

Start      = require('./components/start')

$ ->
  element = React.createElement(Start)
  render(element, document.getElementById('content'))
