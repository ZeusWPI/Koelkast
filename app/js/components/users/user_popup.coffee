React = require 'react'
{ div, img, span } = React.DOM

module.exports = React.createClass
  handleClick: ->
    @props.handleClick()
  render: ->
    div className: "pure-g user-popup",
      div className: "pure-u-11-12",
        div className: "products",
          div className: "pure-g",
            div className: "pure-u-1-5",
              div null,
                span null
                # img src: @props.dagschotel
            div className: "pure-u-1-5",
              div null,
                span null
                # img src: @props.dagschotel
            div className: "pure-u-1-5",
              div null,
                span null
                # img src: @props.dagschotel
            div className: "pure-u-1-5",
              div null,
                span null
                # img src: @props.dagschotel
            div className: "pure-u-1-5 other",
              div null,
                span null, "Other"
      div className: "pure-u-1-12 icon-cancel-wrapper",
        span className: "icon icon-cancel", onClick: @handleClick, null
