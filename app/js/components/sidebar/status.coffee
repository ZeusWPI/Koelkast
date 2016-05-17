React         = require 'react'
{ div, span } = React.DOM
{ connect }   = require 'react-redux'
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
statusToIcon = (status) ->
  classes = ['icon', 'status-icon']
  classes.push switchIcon status
  classes.join(' ')

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
  { status, message }
module.exports = connect(mapStateToProps, null)(Status)
