React              = require 'react'
{ div, img, span } = React.DOM
{ connect }        = require 'react-redux'
classNames         = require 'classnames'
chunk              = require '../../utils/chunk'
{ selectUser }     = require '../../actions/action_creators'
$                  = require 'jquery'

UserPopup = React.createFactory require './user_popup'

UserCard = React.createClass
  render: ->
    { user, selected } = @props
    handleClick = =>
      @props.handleClick(user)
    div className: 'pure-u-1-6', onClick: handleClick,
      div className: classNames('grid-card', selected: selected),
        div className: 'avatar',
          img src: user.avatar, className: 'pure-img center-border-img'
        span className: 'name', user.name
        span className: 'icon icon-down-open', null

mapStateToUserProps = (state, ownProps) ->
  { selected: state.selectedUser == ownProps.user }
mapDispatchToUserProp = (dispatch) =>
  {
    handleClick: (user) ->
      dispatch selectUser(user)
  }
User = connect(mapStateToUserProps, mapDispatchToUserProp)(UserCard)

UserRow = React.createFactory React.createClass
  render: ->
    div className: 'pure-g', @props.users.map (user, i) ->
      React.createElement User, key: i, user: user

UserGrid = React.createClass
  render: ->
    { users, selectedUser } = @props
    div className: 'grid', chunk(users, 6).map (users, i) =>
      div key: i,
        UserRow users: users
        if $.inArray(selectedUser, users) != -1
          UserPopup user: selectedUser

mapStateToUsersProps = (state) ->
  { users, selectedUser } = state
  { users, selectedUser }
module.exports = connect(mapStateToUsersProps, null)(UserGrid)
