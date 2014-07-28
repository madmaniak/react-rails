###* @jsx React.DOM ###

@AddToCart = React.createClass
  handleClick: ->
    AppActions.addItem @props.item

  render: ->
    `<button onClick={this.handleClick}>+</button>`
