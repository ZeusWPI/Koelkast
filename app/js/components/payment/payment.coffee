React         = require 'react'
{ div, span, img } = React.DOM
{ connect }   = require 'react-redux'
{ push } = require 'react-router-redux'
{ createOrder } = require '../../actions/action_creators'

Payment = React.createClass
  handlePayment: (method) ->
    =>
      createOrder { product_id: @props.product.id, method, user_id: @props.user_id }
      @props.finishPayment()
  render: ->
    { product: { avatar }, showFront } = @props
    div className: 'row nopadding',
      div className: 'pure-u-1-2',
        div className: 'payment img-right',
          img className: 'border-img', src: avatar
      div className: 'pure-u-1-2',
        div className: 'payment left',
          span className: 'icon icon-ccw border-img', onClick: showFront
      div className: 'pure-u-1-2',
        div className: 'payment right',
          span className: 'icon icon-dollar border-img', onClick: @handlePayment('cash')
      div className: 'pure-u-1-2',
        div className: 'payment left',
          span className: 'border-img', onClick: @handlePayment('tab'), '\u2621'

mapDispatchToProps = (dispatch) ->
  finishPayment: ->
    dispatch push '/'
module.exports = React.createFactory connect(null, mapDispatchToProps)(Payment)
