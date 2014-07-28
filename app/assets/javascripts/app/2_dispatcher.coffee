@AppDispatcher = copyProperties new Dispatcher(),
  handleViewAction: (action) ->
    @dispatch
      source: 'VIEW_ACTION'
      action: action
