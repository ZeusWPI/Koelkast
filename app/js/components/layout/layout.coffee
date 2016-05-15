React       = require 'react'
{ div }     = React.DOM
{ connect } = require 'react-redux'

Sidebar = React.createFactory require '../sidebar/sidebar'

Layout = React.createClass
  render: ->
    div className: 'pure-g',
      div className: 'pure-u-1-4 sidebar',
        Sidebar path: @props.path,
      div className: 'pure-u-3-4 content',
        @props.children

mapStateToProps = (state, ownProps) ->
  { path: ownProps.location.pathname }
module.exports = connect(mapStateToProps, null)(Layout)
