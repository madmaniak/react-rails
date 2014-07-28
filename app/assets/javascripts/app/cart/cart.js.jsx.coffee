###* @jsx React.DOM ###

cartItems = ->
  items: AppStore.getCart()

@Cart = React.createClass
  getInitialState: ->
    cartItems()

  componentWillMount: ->
    AppStore.addChangeListener(@_onChange)

  _onChange: ->
    @setState cartItems()

  render: ->
    total = 0
    items = @state.items.map (item, i) ->
      subtotal = item.cost*item.qty
      total += subtotal
      `<tr key={i}>
        <td>{item.title}</td>
        <td>{item.qty}</td>
        <td>${subtotal}</td>
      </tr>`

    `<table>
      <thead>
        <tr>
          <th>Item</th>
          <th>Qty</th>
          <th>Subtotal</th>
        </tr>
      </thead>
      <tbody>
        {items}
      </tbody>
      <tfoot>
        <tr>
          <td colSpan="4">Total</td>
          <td>${total}</td>
        </tr>
      </tfoot>
    </table>`
