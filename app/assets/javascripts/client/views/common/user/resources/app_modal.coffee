CP.module "Views.Common.User.Resources", (Resources, CP, Backbone, Marionette, $, _) ->

  class @AppModal extends Backbone.Marionette.ItemView
    template: CPT['common/resources/app_modal']
    events:
      'click .js-modal-close' : 'closeModal'

    initialize: (@options = options = {}) -> @model = @options.model

    templateHelpers: ->
      name = @model.get('name')
      title = @model.get('data')['action'] + " " + @model.get('name')
      data = @model.get('data')
      {name, title, data}

    closeModal: -> CP.modalRegion.close()