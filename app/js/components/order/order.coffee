React              = require 'react'
{ div, img, span } = React.DOM
{ connect }        = require 'react-redux'
{ incrementProduct } = require '../../actions/action_creators'

CurrentOrder = React.createFactory require './current_order'
Barcode      = React.createFactory require './barcode'

ProductCard = React.createClass
  render: ->
    { product, increment } = @props
    div className: 'pure-u-1-4', onClick: increment,
      div className: 'grid-card',
        div className: 'avatar',
          img src: product.avatar, className: 'pure-g center-border-img'
        span className: 'icon icon-plus', null

mapDispatchToProp = (dispatch, ownProps) ->
  { product } = ownProps
  increment: ->
    dispatch incrementProduct(product.id)
Product = React.createFactory connect(null, mapDispatchToProp)(ProductCard)

Order = React.createClass
  render: ->
    div className: 'pure-g',
      div className: 'pure-u-4-5',
        div className: 'grid pure-g',
          Barcode null
          @props.products.map (p, i) ->
            Product key: i, product: p
      div className: 'pure-u-1-5',
        CurrentOrder null

mapStateToProps = (state) ->
  products: state.products
module.exports = connect(mapStateToProps, null)(Order)
