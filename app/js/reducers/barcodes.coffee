{ SET_BARCODES } = require '../constants/action_types'

module.exports = (state = [], action) ->
  switch action.type
    when SET_BARCODES
      return action.barcodes
    else
      return state
