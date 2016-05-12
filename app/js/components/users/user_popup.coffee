React = require 'react'
{ div, img, span } = React.DOM

Product = React.createFactory React.createClass
  render: ->
    div className: 'pure-u-1-5',
      div null,
        span null
        img src: @props.url

module.exports = React.createClass
  render: ->
    div className: 'pure-g user-popup',
      div className: 'pure-u-11-12',
        div className: 'products',
          div className: 'pure-g',
            Product url: @props.user.dagschotel.url
            Product url: @props.user.dagschotel.url
            Product url: @props.user.dagschotel.url
            Product url: @props.user.dagschotel.url
            div className: 'pure-u-1-5 other',
              div null,
                span null, 'Other'
      div className: 'pure-u-1-12 icon-cancel-wrapper',
        span className: 'icon icon-cancel', null
