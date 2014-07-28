@AppActions =
  addItem: (item) ->
    AppDispatcher.handleViewAction
      actionType: AppConstants.ADD_ITEM
      item: item
