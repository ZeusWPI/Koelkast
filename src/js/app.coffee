{ render } = require('react-dom')
Comment    = require('./components/comment')

$ ->
  element = React.createElement(Comment, name: "World", "Lorem ipsum")
  render(element, document.getElementById('content'))
