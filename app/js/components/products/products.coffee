React              = require 'react'
{ div, img, span } = React.DOM
{ connect }        = require 'react-redux'
chunk              = require '../../utils/chunk'

ProductCard = React.createFactory React.createClass
  render: ->
    { product } = @props
    div className: 'pure-u-1-4',
      div className: 'grid-card',
        div className: 'avatar',
          img src: product.avatar, className: 'pure-img center-border-img'
        span className: 'name', product.name
        div null,
          span className: 'attr', '\u20AC', product.price
          span className: 'attr', product.calories, ' calories'
          span className: 'attr', product.category
        span null, product.stock, ' left'

ProductGrid = React.createClass
  render: ->
    { products } = @props
    div className: 'grid pure-g', products.map (product, i) =>
      ProductCard key: i, product: product

mapStateToProductsProps = (state) ->
  { products } = state
  return { products }
module.exports = connect(mapStateToProductsProps, null)(ProductGrid)
