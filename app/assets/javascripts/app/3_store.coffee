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
