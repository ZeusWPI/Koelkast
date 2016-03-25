{ div, h1 } = require('react').DOM
{ render }  = require('react-dom')

module.exports = React.createClass
  render: ->
    h1 null, "Hello world"
