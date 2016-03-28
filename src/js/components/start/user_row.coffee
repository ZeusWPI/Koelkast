React   = require 'react'
{ div } = React.DOM

User = React.createFactory require './user'

module.exports = React.createClass
  render: ->
    handleClick = @props.handleClick
    userNodes = @props.data.map (user) ->
      User key: user.id, id: user.id, handleClick: handleClick, name: user.name, avatar: user.avatar

    div className: "pure-g", userNodes
