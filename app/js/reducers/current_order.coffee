{ INCREMENT_PRODUCT, DECREMENT_PRODUCT } = require '../constants/action_types'

module.exports = (state = {}, action) ->
  switch action.type
    when INCREMENT_PRODUCT
      { id } = action
      p = {}
      p[id] = (state[id] || 0) + 1
      Object.assign {}, state, p
    when DECREMENT_PRODUCT
      { id } = action
      return state if state[id] == undefined
      if state[id] == 1
        newState = Object.assign {}, state
        delete newState[id]
        newState
      else
        p = {}
        p[id] = state[id] - 1
        Object.assign {}, state, p
    else
      return state

