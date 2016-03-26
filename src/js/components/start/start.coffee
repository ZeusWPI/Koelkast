React   = require('react')
{ div } = React.DOM

Users   = React.createFactory require('./users')

module.exports = React.createClass
  render: ->
    div className: "pure-g", 
      div className: "pure-u-1",
        Users url: 'http://localhost:3000/users.json'
