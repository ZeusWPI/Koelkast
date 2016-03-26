React   = require('react')
{ div } = React.DOM
$       = require('jquery')

User    = React.createFactory require('./user')

module.exports = React.createClass
  loadUsersFromServer: ->
    $.ajax
      url: @props.url
      dataType: 'json'
      type: 'GET'
      success:( (data) ->
        @setState { data }
        console.log data
      ).bind(@)
      error:( (xhr, status, err) ->
        console.error @props.url, status, err.toString()
      ).bind(@)
  getInitialState: ->
    { data: [] }
  componentDidMount: ->
    @loadUsersFromServer()
  render: ->
    userNodes = @state.data.map (user) ->
      User(key: user.id, name: user.name)

    div null, userNodes
