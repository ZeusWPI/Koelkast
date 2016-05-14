React   = require 'react'
{ div } = React.DOM

Sidebar = React.createFactory require '../sidebar/sidebar'

module.exports = React.createClass
  render: ->
    div className: 'pure-g',
      div className: 'pure-u-1-4 sidebar',
        Sidebar null,
      div className: 'pure-u-3-4 content',
        @props.children
