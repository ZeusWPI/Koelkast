{ SELECT_USER } = require '../constants/action_types'

module.exports = (state = null, action) ->
  switch action.type
    when SELECT_USER
      return action.user
    else
      return state
