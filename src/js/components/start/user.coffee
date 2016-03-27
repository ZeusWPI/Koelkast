React   = require('react')
{ div, span, img } = React.DOM

module.exports = React.createClass
  render: ->
    div key: @props.id, className: "pure-u-1-4",
      div className: "user",
        div className: "user-avatar",
          img src: @props.avatar, className: "pure-img",
        span className: "user-name", @props.name
        span className: "icon icon-down-open", null
