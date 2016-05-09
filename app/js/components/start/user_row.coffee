React   = require 'react'
{ div } = React.DOM

User = React.createFactory require './user'

module.exports = React.createClass
  render: ->
    { handleClick, selected } = @props
    userNodes = @props.data.map (user) ->
      User key: user.id, id: user.id, handleClick: handleClick, name: user.name, avatar: user.avatar, selected: selected == user.id

    div className: "pure-g", userNodes
