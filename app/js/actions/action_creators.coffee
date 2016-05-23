{
  DECREMENT_PRODUCT,
  INCREMENT_PRODUCT,
  SELECT_USER,
  SET_BARCODES,
  SET_PRODUCTS,
  SET_USERS,
  STATUS
} = require '../constants/action_types'
{ PROCESSING, PROCESSED, ERROR } = require '../constants/status_types'

module.exports.decrementProduct = (id) ->
  { type: DECREMENT_PRODUCT, id }

module.exports.incrementProduct = (id) ->
  { type: INCREMENT_PRODUCT, id }

module.exports.selectUser = (user) ->
  { type: SELECT_USER, user }

module.exports.setBarcodes = (barcodes) ->
  { type: SET_BARCODES, barcodes }

module.exports.setProducts = (products) ->
  { type: SET_PRODUCTS, products }

module.exports.setUsers = (users) ->
  { type: SET_USERS, users }

status = (type, message) ->
  { type: STATUS, status: type, message }

module.exports.statusProcessing = (message) ->
  status(PROCESSING, message)
module.exports.statusProcessed = (message) ->
  status(PROCESSED, message)
module.exports.statusError = (message) ->
  status(ERROR, message)
