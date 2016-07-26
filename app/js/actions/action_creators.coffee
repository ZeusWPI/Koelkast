url = require 'url'
{
  SELECT_USER,
  SET_BARCODES,
  SET_PRODUCTS,
  SET_USERS,
  STATUS
} = require '../constants/action_types'
{ PROCESSING, PROCESSED, ERROR } = require '../constants/status_types'

API_URL = 'http://localhost:3000'

module.exports.selectUser = (user) ->
  { type: SELECT_USER, user }
module.exports.clearSelectUser = ->
  { type: SELECT_USER, user: null }

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
  (dispatch) ->
    fetch url.resolve(API_URL, path)
      .then (response) ->
        throw new Error('Bad response from server') if response.status >= 400
        return response.json()
      .then (data) ->
        dispatch callback data

module.exports.fetchUsers = () ->
  loadData '/api/v1/users.json', setUsers

module.exports.fetchProducts = () ->
  loadData '/api/v1/products.json', setProducts

module.exports.fetchBarcodes = () ->
  loadData '/api/v1/barcodes.json', setBarcodes

module.exports.createOrder = (order) ->
  fetch url.resolve(API_URL, '/api/v1/orders.json'), {
    method: 'POST',
    headers: {
      'Accept': 'application/json',
      'Content-Type': 'application/json'
    },
    body: JSON.stringify(order)
  }
    .then (response) ->
      throw new Error('Bad response from server') if response.status >= 400
      true
