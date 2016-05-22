React       = require 'react'
{ div, img, button, span } = React.DOM
{ connect } = require 'react-redux'
$           = require 'jquery'
{ INCREMENT_PRODUCT, DECREMENT_PRODUCT } = require '../../constants/action_types'

OrderItem = React.createFactory React.createClass
  render: ->
    { product, count, decrement } = @props
    div className: 'order-item', onClick: decrement,
      div className: 'avatar',
        img src: product.avatar, className: 'pure-img small-border-img'
      span className: 'count', 'x', count if count > 1

mapDispatchToItemProps = (dispatch, ownProps) ->
  { product } = ownProps
  decrement: ->
    dispatch { type: DECREMENT_PRODUCT, id: product.id }
OrderItemWrapper = React.createFactory connect(null, mapDispatchToItemProps)(OrderItem)

CurrentOrder = React.createClass
  render: ->
    { products, getProduct } = @props
    div null,
      Object.keys(products).map (id, i) =>
        OrderItemWrapper key: i, product: getProduct(id), count: products[id]

mapStateToProps = (state) ->
  products: state.currentOrder
  getProduct: (id) ->
    state.products.find (p) ->
      p.id == parseInt(id)
module.exports = connect(mapStateToProps, null)(CurrentOrder)
