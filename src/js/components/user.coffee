React   = require('react')
{ div, img } = React.DOM

module.exports = React.createClass
  render: ->
    div key: @props.id, className: "pure-u-1-4 user",
      img(src: @props.avatar),
      @props.name
