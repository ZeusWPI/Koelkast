React         = require 'react'
{ div, span } = React.DOM
{ connect }   = require 'react-redux'
{ PROCESSING, PROCESSED, ERROR } = require '../../constants/status_types'

statusToIcon = (status) ->
  switch status
    when PROCESSING
      'icon icon-spin6 animate-spin'
    when PROCESSED
      'icon icon-ok'
    when ERROR
      'icon icon-cancel'
    else
      null

Status = React.createClass
  render: ->
    { status, message } = @props
    if status != undefined
      div className: 'status',
        span className: statusToIcon(status)
        message
    else
      null

mapStateToProps = (state) ->
  { status, message } = state.status
  {
    status: status,
    message: message
  }
module.exports = connect(mapStateToProps, null)(Status)
