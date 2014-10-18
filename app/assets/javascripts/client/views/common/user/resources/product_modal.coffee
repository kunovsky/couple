CP.module "Views.Common.User.Resources", (Resources, CP, Backbone, Marionette, $, _) ->

  class @ProductModal extends Backbone.Marionette.ItemView
    template: CPT['common/resources/product_modal']
    events:
      'click .js-purchase'                 : 'handlePurchase'
      'click .js-modal-close'              : 'closeModal'
      'click .js-access-external-resource' : 'visitPage'


    initialize: (@options = options = {}) ->
      @model = @options.model
      @url = @model.get('data')['url']

    templateHelpers: ->
      name = @model.get('name')
      title = @model.get('data')['action'] + " " + @model.get('name')
      data = @model.get('data')
      {name, title, data}

    closeModal: -> CP.modalRegion.close()

    visitPage: -> window.open @url if @url != ""

    handlePurchase: -> console.log "Purchasing"