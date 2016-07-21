React                      = require 'react'
FlipCard                   = React.createFactory require 'react-flipcard'
{ div, img, span, button } = React.DOM
{ connect }                = require 'react-redux'
$                          = require 'jquery'

Barcode = React.createFactory require './barcode'
Payment = React.createFactory require '../payment/payment'

ProductCard = React.createFactory React.createClass
  showBack: ->
    @props.setFlipped @props.product.id
  showFront: ->
    @props.setFlipped null
  onFlip: ->
    document.activeElement.blur()
  render: ->
    { product } = @props
    div className: 'pure-u-1-6',
      div className: 'grid-card fixed',
        FlipCard disabled: true, flipped: @props.flipped, onFlip: @onFlip,
          div onClick: @showBack,
            div className: 'avatar',
              img src: product.avatar, className: 'center-border-img'
          Payment product: product, showFront: @showFront, user_id: @props.user_id

Order = React.createClass
  getInitialState: ->
    flipped: null
  setFlipped: (s) ->
    @setState flipped: s
  render: ->
    div className: 'grid',
      Barcode null
      @props.products.map (p, i) =>
        ProductCard key: i, product: p, flipped: p.id == @state.flipped, setFlipped: @setFlipped, user_id: @props.params.user_id

mapStateToProps = (state) ->
  products: state.products
module.exports = connect(mapStateToProps, null)(Order)
