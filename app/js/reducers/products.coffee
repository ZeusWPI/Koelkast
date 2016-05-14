{ SET_PRODUCTS } = require '../constants/action_types'

module.exports = (state = [], action) ->
  switch action.type
    when SET_PRODUCTS
      return action.products
    else
      return state
