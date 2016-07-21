React              = require 'react'
{ div, img, span } = React.DOM
{ connect }        = require 'react-redux'
{ selectUser }     = require '../../actions/action_creators'
fill               = require '../../utils/fill'

Payment  = React.createFactory require '../payment/payment'
Link     = React.createFactory require('react-router').Link
FlipCard = React.createFactory require 'react-flipcard'

Productt = React.createClass
  onFlip: ->
    document.activeElement.blur()
  showBack: ->
    @props.setFlipped @props.product.id
  showFront: ->
    @props.setFlipped null
  render: ->
    { product, flipped } = @props
    div className: 'pure-u-1-6',
      div className: 'grid-card fixed',
        unless product.avatar == undefined
          FlipCard disabled: true, flipped: flipped, onFlip: @onFlip,
            div onClick: @showBack,
              div className: 'avatar',
                img src: product.avatar, className: 'center-border-img'
            Payment product: product, showFront: @showFront, user_id: @props.user_id

mapStateToProps = (state) ->
  user_id: state.selectedUser.id
Product = React.createFactory connect(mapStateToProps)(Productt)

UserPopup = React.createClass
  getInitialState: ->
    flipped: null
  setFlipped: (s) ->
    @setState flipped: s
  render: ->
    { user, cancel } = @props
    most_ordered = fill(user.quick_order, { }, 4)
    div className: 'pure-g user-popup',
      div className: 'pure-u-1-24'
      most_ordered.map (p, i) =>
        Product key: i, product: p, flipped: p.id == @state.flipped, setFlipped: @setFlipped
      div className: 'pure-u-1-6 text',
        Link to: '/order/' + user.id,
          div className: 'grid-card fixed',
            span null, 'Other'
      div className: 'pure-u-1-12 icon-cancel-wrapper',
        span className: 'icon icon-cancel', onClick: cancel, null

mapDispatchToProps = (dispatch) ->
  cancel: ->
    dispatch selectUser(null)
module.exports = connect(null, mapDispatchToProps)(UserPopup)
