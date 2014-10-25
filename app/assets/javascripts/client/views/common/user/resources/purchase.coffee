CP.module "Views.Common.User.Resources", (Resources, CP, Backbone, Marionette, $, _) ->

  class @Purchase extends Backbone.Marionette.ItemView
    template: CPT['common/resources/purchase']
    className: 'purchase__product__container'
    events:
      'click .js-purchase' : 'handlePurchase'

    initialize: (@options = options = {}) ->
      @model = @options.model

    templateHelpers: ->
      name = @model.get('name')
      title = @model.get('data')['action'] + " " + @model.get('name')
      data = @model.get('data')
      {name, title, data}

    handlePurchase: (e)  ->
      e.preventDefault()
      console.log "purchasing"