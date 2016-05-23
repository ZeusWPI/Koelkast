{ SELECT_USER } = require '../constants/action_types'

module.exports = (state = null, action) ->
  switch action.type
    when SELECT_USER
      if state == action.user
        return null
      else
        return action.user
    else
      return state
