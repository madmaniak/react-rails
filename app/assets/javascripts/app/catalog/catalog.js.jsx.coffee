###* @jsx React.DOM ###

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
    </table>`
