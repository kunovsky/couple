CP.module "Views.Globals.Modals", (Modals, CP, Backbone, Marionette, $, _) ->

  class @InfoModal extends Backbone.Marionette.ItemView
    template: CPT['globals/modals/info_modal']
    className: 'info-modal'
    events: 'click .js-modal-close' : 'closeModal'

    initialize: (@option = options = {})->
      @title = @options.title

    templateHelpers: ->
      {@title}
      
    closeModal: (e) ->
      e.preventDefault()
      CP.modalRegion.close()
