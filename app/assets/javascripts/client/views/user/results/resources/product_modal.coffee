CP.module "Views.User.Results.Resources", (Resources, CP, Backbone, Marionette, $, _) ->

  class @ProductModal extends Backbone.Marionette.ItemView
    template: CPT['user/results/resources/product_modal']
    events:
      'click .js-modal-close' : 'closeModal'

    initialize: (@options = options = {}) ->
      @model = @options.model

    templateHelpers: ->
      name = @model.get('name')
      {name}

    closeModal: ->
      CP.modalRegion.close()

