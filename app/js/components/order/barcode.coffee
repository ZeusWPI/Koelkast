React                 = require 'react'
{ div, input, form }  = React.DOM
{ connect }           = require 'react-redux'
{ incrementProduct, statusError } = require '../../actions/action_creators'

Barcode = React.createClass
  onSubmit: (e) ->
    e.preventDefault()
    @props.handleSubmit(@input.value)
    @input.value = ''
  render: ->
    div className: 'pure-u-1 barcode-wrapper',
      form onSubmit: @onSubmit,
        input type: 'number', className: 'barcode', autoFocus: true, placeholder: '123', ref: (node) => @input = node

mapStateToProps = (state) ->
  getProduct: (barcode) ->
    state.barcodes.find (b) ->
      b.code == barcode
mapDispatchToProps = (dispatch) ->
  handleSubmit: (id) ->
    dispatch incrementProduct(id)
  failed: ->
    dispatch statusError('Unknown barcode')
mergeProps = (stateProps, dispatchProps, ownProps) ->
  Object.assign {}, ownProps, handleSubmit: (barcode) ->
    barcode = stateProps.getProduct(barcode)
    if barcode == undefined
      dispatchProps.failed()
    else
      dispatchProps.handleSubmit(barcode.product)
module.exports = connect(mapStateToProps, mapDispatchToProps, mergeProps)(Barcode)
