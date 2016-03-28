React = require('react')
{ div, img, span } = React.DOM

module.exports = React.createClass
  handleClick: ->
    @props.handleClick(null)
  render: ->
    div className: "pure-g user-popup",
      div className: "pure-u-1-4",
        div className: "user-avatar",
          img src: @props.avatar, className: "pure-img border-img"
      div className: "pure-u-2-3 products-wrapper",
        div className: "products",
          div className: "pure-g",
            div className: "pure-u-1-3",
              div null,
                img src: @props.dagschotel
            div className: "pure-u-1-3",
              div null,
                img src: @props.dagschotel
            div className: "pure-u-1-3 other",
              div null,
                span null, "Other"
      div className: "pure-u-1-12",
        span className: "icon icon-cancel", onClick: @handleClick, null
