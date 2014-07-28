###* @jsx React.DOM ###

@APP = React.createClass
  handleClick: ->
    alert 1

  render: ->
    `<h1 onClick={this.handleClick}>My flux app</h1>`

React.renderComponent `<APP />`, document.body
