React       = require('react')
{ div, h1 } = React.DOM
{ render }  = require('react-dom')

module.exports = React.createClass
  render: ->
    h1 null, "Hello world"
