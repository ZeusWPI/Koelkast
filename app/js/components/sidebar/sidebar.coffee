React           = require 'react'
{ div, h1, h2 } = React.DOM
Link            = React.createFactory require('react-router').Link

Status = React.createFactory require './status'

module.exports = React.createClass
  render: ->
    div null,
      Status null
      div className: 'header',
        h1 null, 'Tap'
        h2 null, 'Persoonlijke barman van Zeus WPI'
        div className: 'node',
          Link to: '/', className: 'pure-button', 'Order as guest'
        div className: 'node',
          if @props.path == "/"
            Link to: '/products', className: 'pure-button', 'View products'
          else if @props.path == "/products"
            Link to: '/', className: 'pure-button', 'Order here'
        div className: 'footer',
          'Bugs can be reported on github.com/ZeusWPI/Tap'
