{ SET_USERS } = require '../constants/action_types'

module.exports = (state = [], action) ->
  switch action.type
    when SET_USERS
      return action.users
    else
      return state
