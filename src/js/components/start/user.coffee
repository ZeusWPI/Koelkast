React = require('react')
{ div, span, img } = React.DOM

module.exports = React.createClass
  handleClick: ->
    @props.handleClick(@props.id)
  render: ->
    div className: "pure-u-1-4", onClick: @handleClick,
      div className: "user",
        div className: "user-avatar",
          img src: @props.avatar, className: "pure-img border-img",
        span className: "user-name", @props.name
        span className: "icon icon-down-open", null
