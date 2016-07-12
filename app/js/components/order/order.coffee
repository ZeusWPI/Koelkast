React              = require 'react'
FlipCard           = React.createFactory require 'react-flipcard'
{ div, img, span, button } = React.DOM
{ connect }        = require 'react-redux'
{ incrementProduct } = require '../../actions/action_creators'

Barcode      = React.createFactory require './barcode'

Payment = React.createFactory React.createClass
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
          span className: 'icon icon-dollar border-img'
      div className: 'pure-u-1-2',
        div className: 'payment left',
          span className: 'border-img', '\u2621'

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
              img src: product.avatar, className: 'pure-g center-border-img'
          Payment product: product, showFront: @showFront

Order = React.createClass
  getInitialState: ->
    flipped: null
  setFlipped: (s) ->
    @setState flipped: s
  render: ->
    div className: 'grid',
      Barcode null
      @props.products.map (p, i) =>
        ProductCard key: i, product: p, flipped: p.id == @state.flipped, setFlipped: @setFlipped

mapStateToProps = (state) ->
  products: state.products
module.exports = connect(mapStateToProps, null)(Order)
