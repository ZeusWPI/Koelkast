url = require 'url'
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

API_URL = 'http://localhost:3000'

module.exports.decrementProduct = (id) ->
  { type: DECREMENT_PRODUCT, id }

module.exports.incrementProduct = (id) ->
  { type: INCREMENT_PRODUCT, id }

module.exports.selectUser = (user) ->
  { type: SELECT_USER, user }

setBarcodes = (barcodes) ->
  { type: SET_BARCODES, barcodes }
module.exports.setUsers = setBarcodes

setProducts = (products) ->
  { type: SET_PRODUCTS, products }
module.exports.setUsers = setProducts

setUsers = (users) ->
  { type: SET_USERS, users }
module.exports.setUsers = setUsers

status = (type, message) ->
  { type: STATUS, status: type, message }

module.exports.statusProcessing = (message) ->
  status(PROCESSING, message)
module.exports.statusProcessed = (message) ->
  status(PROCESSED, message)
module.exports.statusError = (message) ->
  status(ERROR, message)

loadData = (path, callback) ->
  fetch url.resolve(API_URL, path)
    .then (response) ->
      throw new Error('Bad response from server') if response.status >= 400
      return response.json()
    .then (data) ->
      return callback data

module.exports.fetchUsers = () ->
  loadData 'users.json', setUsers

module.exports.fetchProducts = () ->
  loadData 'products.json', setProducts

module.exports.fetchBarcodes = () ->
  loadData 'barcodes.json', setBarcodes
