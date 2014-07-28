###* @jsx React.DOM ###

@AppConstants =
  ADD_ITEM: 'ADD_ITEM'

CHANGE_EVENT = 'change'

@AppDispatcher = copyProperties new Dispatcher(),
  handleViewAction: (action) ->
    @dispatch
      source: 'VIEW_ACTION'
      action: action

@AppActions =
  addItem: (item) ->
    AppDispatcher.handleViewAction
      actionType: AppConstants.ADD_ITEM
      item: item

@APP = React.createClass
  handleClick: ->
    AppActions.addItem('this is the item')

  render: ->
    `<h1 onClick={this.handleClick}>My flux app</h1>`

React.renderComponent `<APP />`, document.body
