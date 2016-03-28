React = require('react')
{ div } = React.DOM
$       = require('jquery')

UserRow   = React.createFactory require('./user_row')
UserPopup = React.createFactory require('./user_popup')

module.exports = React.createClass
  getInitialState: ->
    { selected: null }
  handleClick: (user_id) ->
    @setState (prev) ->
      if prev.selected == user_id
        { selected: null }
      else
        { selected: user_id }
  render: ->
    data = @props.data.slice()
    state = @state
    children = []

    while(data.length) 
      user_row_data = data.splice(0,4)
      children.push UserRow key: data.length, data: user_row_data, handleClick: @handleClick

      match = $.grep(user_row_data, (e) -> e.id == state.selected)
      if match.length
        children.push UserPopup key: 'popup', name: match[0].name, dagschotel: match[0].dagschotel.url, avatar: match[0].avatar, handleClick: @handleClick

    div null, children
