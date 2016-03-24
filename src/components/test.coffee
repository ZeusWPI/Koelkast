{ h1 }     = React.DOM
{ render } = ReactDOM

Comment = React.createClass
  render: ->
    h1 null, "Hello world"

$ ->
  element = React.createElement(Comment, name: "World", "Lorem ipsum")
  render(element, document.getElementById('content'))
