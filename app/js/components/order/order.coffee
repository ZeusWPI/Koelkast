React   = require 'react'
{ div } = React.DOM

module.exports = React.createClass
  render: ->
    console.log @props
    div null, "hallo"
