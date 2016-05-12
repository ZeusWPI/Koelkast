React              = require 'react'
{ div, img, span } = React.DOM
{ connect }        = require 'react-redux'
chunk              = require '../../utils/chunk'

User = React.createFactory React.createClass
  render: ->
    div className: 'pure-u-1-4',
      div className: 'user',
        div className: 'user-avatar',
          img src: @props.user.avatar, className: 'pure-img border-img'
        span className: 'user-name', @props.user.name
        span className: 'icon icon-down-open', null

UserRow = React.createFactory React.createClass
  render: ->
    div className: 'pure-g', @props.users.map (user, i) ->
      User key: i, user: user

UserGrid = React.createClass
  render: ->
    div null, chunk(@props.users, 4).map (users, i) ->
      UserRow key: i, users: users

mapStateToUsersProps = (state) ->
  return { users: state.users }
Users = connect(mapStateToUsersProps, null)(UserGrid)

module.exports = Users
