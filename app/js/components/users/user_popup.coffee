React              = require 'react'
{ div, img, span } = React.DOM
{ connect }        = require 'react-redux'
{ SELECT_USER }    = require '../../constants/action_types'
fill               = require '../../utils/fill'

Product = React.createFactory React.createClass
  render: ->
    div className: 'pure-u-1-5',
      div null,
        span null
        @props.children

UserPopup = React.createClass
  render: ->
    { user, cancel } = @props
    most_ordered = fill(user.most_ordered, { }, 3)
    div className: 'pure-g user-popup',
      div className: 'pure-u-11-12',
        div className: 'products',
          div className: 'pure-g',
            Product null,
              img src: user.dagschotel.url
            most_ordered.map (p, i) ->
              Product key: i,
                if p.url == undefined
                  span className: 'icon icon-help', null
                else
                  img src: p.url
            Product null,
              span null, 'Other'
      div className: 'pure-u-1-12 icon-cancel-wrapper',
        span className: 'icon icon-cancel', onClick: cancel, null

mapDispatchToProps = (dispatch) ->
  {
    cancel: ->
      dispatch {
        type: SELECT_USER,
        user: null
      }
  }
module.exports = connect(null, mapDispatchToProps)(UserPopup)
