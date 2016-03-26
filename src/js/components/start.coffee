React   = require('react')
{ div } = React.DOM

Users   = React.createFactory require('./users')
SideBar = React.createFactory require('./sidebar')

module.exports = React.createClass
  render: ->
    div className: "pure-g", 
      div className: "pure-u-3-4",
        Users url: 'http://localhost:3000/users.json'
      div className: "pure-u-1-4",
        SideBar null
