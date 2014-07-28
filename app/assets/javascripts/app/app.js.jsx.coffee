###* @jsx React.DOM ###
#
#= require_tree ./catalog
#= require_tree ./cart

@APP = React.createClass
  render: ->
    `<div>
      <Catalog />
      <Cart />
    </div>`

React.renderComponent `<APP />`, document.body
