React              = require 'react'
{ div, img, span } = React.DOM
{ connect }        = require 'react-redux'
{ selectUser }     = require '../../actions/action_creators'
fill               = require '../../utils/fill'
Link               = React.createFactory require('react-router').Link

Product = React.createFactory React.createClass
  render: ->
    div className: 'pure-u-1-5',
      div null,
        span null
        @props.children

UserPopup = React.createClass
  render: ->
    { user, cancel } = @props
    most_ordered = fill(user.quick_order, { }, 4)
    div className: 'pure-g user-popup',
      div className: 'pure-u-11-12',
        div className: 'products',
          div className: 'pure-g',
            most_ordered.map (p, i) ->
              Product key: i,
                if p.url == undefined
                  span className: 'icon icon-help', null
                else
                  img src: p.url
            div className: 'pure-u-1-5',
              Link to: '/order/' + user.id,
                div null,
                  span null
                  span null, 'Other'
      div className: 'pure-u-1-12 icon-cancel-wrapper',
        span className: 'icon icon-cancel', onClick: cancel, null

mapDispatchToProps = (dispatch) ->
  {
    cancel: ->
      dispatch selectUser(null)
  }
module.exports = connect(null, mapDispatchToProps)(UserPopup)
