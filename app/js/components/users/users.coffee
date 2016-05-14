React              = require 'react'
{ div, img, span } = React.DOM
{ connect }        = require 'react-redux'
chunk              = require '../../utils/chunk'
{ SELECT_USER }    = require '../../constants/action_types'
$                  = require 'jquery'

UserPopup = React.createFactory require './user_popup'

UserCard = React.createClass
  render: ->
    { user } = @props
    handleClick = =>
      @props.handleClick(user)
    div className: 'pure-u-1-4', onClick: handleClick,
      div className: 'user',
        div className: 'user-avatar',
          img src: user.avatar, className: 'pure-img border-img'
        span className: 'user-name', user.name
        span className: 'icon icon-down-open', null

mapDispatchToUserProp = (dispatch) ->
  {
    handleClick: (user) ->
      dispatch {
        type: SELECT_USER,
        user: user
      }
  }
User = connect(null, mapDispatchToUserProp)(UserCard)

UserRow = React.createFactory React.createClass
  render: ->
    div className: 'pure-g', @props.users.map (user, i) ->
      React.createElement User, key: i, user: user

UserGrid = React.createClass
  render: ->
    { users, select_user } = @props
    div null, chunk(users, 4).map (users, i) =>
      div key: i,
        UserRow users: users
        if $.inArray(select_user, users) != -1
          UserPopup user: select_user

mapStateToUsersProps = (state) ->
  { users, select_user } = state
  return { users, select_user }
module.exports = connect(mapStateToUsersProps, null)(UserGrid)
