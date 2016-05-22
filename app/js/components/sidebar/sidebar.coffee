React           = require 'react'
{ div, h1, h2 } = React.DOM
Link            = React.createFactory require('react-router').Link

Status = React.createFactory require './status'

ConditionalLink = React.createFactory React.createClass
  render: ->
    { currentPath, path, children } = @props
    div className: 'node',
      Link to: path, className: 'pure-button', children unless currentPath == path


module.exports = React.createClass
  render: ->
    { path } = @props
    div null,
      Status null
      div className: 'header',
        h1 null, 'Tap'
        h2 null, 'Persoonlijke barman van Zeus WPI'
        div className: 'node',
          Link to: '/', className: 'pure-button', 'Order as guest'
        ConditionalLink currentPath: path, path: '/', 'Order Here'
        ConditionalLink currentPath: path, path: '/products', 'View products'
        div className: 'footer',
          'Bugs can be reported on github.com/ZeusWPI/Tap'
