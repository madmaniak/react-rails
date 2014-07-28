###* @jsx React.DOM ###

_catalog = [
    {id:1, title: 'Widget #1', cost: 1},
    {id:2, title: 'Widget #2', cost: 2},
    {id:3, title: 'Widget #3', cost: 3}
  ]

_cartItems = []

_increaseItem = (index) ->
  _cartItems[index].qty++

_addItem = (item) ->
  if(!item.inCart)
    item['qty'] = 1
    item['inCart'] = true
    _cartItems.push(item)
  else
    _cartItems.forEach (cartItem, i)->
      if(cartItem.id == item.id)
        _increaseItem(i)


@AppConstants =
  ADD_ITEM: 'ADD_ITEM'

@AppDispatcher = copyProperties new Dispatcher(),
  handleViewAction: (action) ->
    @dispatch
      source: 'VIEW_ACTION'
      action: action

CHANGE_EVENT = 'change'

@AppStore = copyProperties new EventEmitter(),
  emitChange: ->
    @emit CHANGE_EVENT

  addChangeListener: (callback) ->
    @on CHANGE_EVENT, callback

  removeChangeListener: (callback) ->
    @removeListener CHANGE_EVENT, callback

  getCart: -> _cartItems

  getCatalog: -> _catalog

  dispatcherIndex: AppDispatcher.register (payload) ->
    action = payload.action

    switch action.actionType
      when AppConstants.ADD_ITEM
        _addItem(payload.action.item)

    AppStore.emitChange()

@AppActions =
  addItem: (item) ->
    AppDispatcher.handleViewAction
      actionType: AppConstants.ADD_ITEM
      item: item

@AddToCart = React.createClass
  handleClick: ->
    AppActions.addItem @props.item

  render: ->
    `<button onClick={this.handleClick}>+</button>`

getCatalog = ->
  items: AppStore.getCatalog()


@Catalog = React.createClass
  getInitialState: ->
    getCatalog()

  render: ->
    items = @state.items.map (item) ->
      `<tr>
        <td>{item.title}</td>
        <td>${item.cost}</td>
        <td><AddToCart item={item} /></td>
      </tr>`

    `<table>
      {items}
    </table>
    `

React.renderComponent `<Catalog />`, document.body
