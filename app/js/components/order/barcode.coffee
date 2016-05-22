React              = require 'react'
{ div, input } = React.DOM
{ connect }        = require 'react-redux'

Barcode = React.createClass
  render: ->
    div className: 'pure-u-1 barcode-wrapper',
      input type: 'number', className: 'barcode', autoFocus: true

module.exports = connect(null, null)(Barcode)
