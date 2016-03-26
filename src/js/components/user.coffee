React   = require('react')
{ div } = React.DOM

module.exports = React.createClass
  render: ->
    div key: @props.id, @props.name
