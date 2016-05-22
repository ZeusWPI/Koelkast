React              = require 'react'
{ div, img, span } = React.DOM
{ connect }        = require 'react-redux'
classNames         = require 'classnames'
chunk              = require '../../utils/chunk'
{ SELECT_USER }    = require '../../constants/action_types'
$                  = require 'jquery'

UserPopup = React.createFactory require './user_popup'

UserCard = React.createClass
  render: ->
    { user, selected } = @props
    handleClick = =>
      @props.handleClick(user)
    div className: 'pure-u-1-4', onClick: handleClick,
      div className: classNames('grid-card', selected: selected),
        div className: 'avatar',
          img src: user.avatar, className: 'pure-img center-border-img'
        span className: 'name', user.name
        span className: 'icon icon-down-open', null

mapStateToUserProps = (state, ownProps) ->
  { selected: state.select_user == ownProps.user }
mapDispatchToUserProp = (dispatch) ->
  {
    handleClick: (user) ->
      dispatch {
        type: SELECT_USER,
        user: user
      }
  }
User = connect(mapStateToUserProps, mapDispatchToUserProp)(UserCard)

UserRow = React.createFactory React.createClass
  render: ->
    div className: 'pure-g', @props.users.map (user, i) ->
      React.createElement User, key: i, user: user

UserGrid = React.createClass
  render: ->
    { users, select_user } = @props
    div className: 'grid', chunk(users, 4).map (users, i) =>
      div key: i,
        UserRow users: users
        if $.inArray(select_user, users) != -1
          UserPopup user: select_user

mapStateToUsersProps = (state) ->
  { users, select_user } = state
  return { users, select_user }
module.exports = connect(mapStateToUsersProps, null)(UserGrid)
