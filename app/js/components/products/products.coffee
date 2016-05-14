React              = require 'react'
{ div, img, span } = React.DOM
{ connect }        = require 'react-redux'
chunk              = require '../../utils/chunk'

ProductCard = React.createClass
  render: ->
    { product } = @props
    handleClick = =>
      @props.handleClick(product)
    div className: 'pure-u-1-4', onClick: handleClick,
      div className: 'grid-card',
        div className: 'avatar',
          img src: product.avatar, className: 'pure-img border-img'
        span className: 'name', product.name
        div null,
          span className: 'attr', '\u20AC', product.price
          span className: 'attr', product.calories, ' calories'
          span className: 'attr', product.category
        span null, product.stock, ' left'

ProductRow = React.createFactory React.createClass
  render: ->
    div className: 'pure-g', @props.products.map (product, i) ->
      React.createElement ProductCard, key: i, product: product

ProductGrid = React.createClass
  render: ->
    { products } = @props
    div className: 'grid', chunk(products, 4).map (products, i) =>
      ProductRow key: i, products: products

mapStateToProductsProps = (state) ->
  { products } = state
  return { products }
module.exports = connect(mapStateToProductsProps, null)(ProductGrid)
