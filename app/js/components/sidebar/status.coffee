React         = require 'react'
{ div, span } = React.DOM
{ connect }   = require 'react-redux'
classNames    = require 'classnames'
{ PROCESSING, PROCESSED, ERROR } = require '../../constants/status_types'

switchIcon = (status) ->
  switch status
    when PROCESSING
      'icon-spin6 animate-spin'
    when PROCESSED
      'icon-ok'
    when ERROR
      'icon-cancel'
    else
      null

Status = React.createClass
  render: ->
    { status, message } = @props
    if status != undefined
      div className: 'status',
        span className: classNames('icon', 'status-icon', switchIcon(status))
        message
    else
      null

mapStateToProps = (state) ->
  { status, message } = state.status
  { status, message }
module.exports = connect(mapStateToProps, null)(Status)
