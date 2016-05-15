{ STATUS } = require '../constants/action_types'

module.exports = (state = {}, action) ->
  switch action.type
    when STATUS
      return {
        status: action.status,
        message: action.message
      }
    else
      return state
