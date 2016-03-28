React   = require('react')
$       = require('jquery')

UserGrid = React.createFactory require('./user_grid')

module.exports = React.createClass
  loadUsersFromServer: ->
    $.ajax
      url: @props.url
      dataType: 'json'
      type: 'GET'
      success:( (data) ->
        @setState { data: data }
      ).bind(@)
      error:( (xhr, status, err) ->
        console.error @props.url, status, err.toString()
      ).bind(@)
  getInitialState: ->
    { data: [] }
  componentDidMount: ->
    @loadUsersFromServer()
  render: ->
    UserGrid data: @state.data
