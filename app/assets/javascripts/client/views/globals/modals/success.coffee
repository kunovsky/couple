CP.module "Views.Globals.Modals", (Modals, CP, Backbone, Marionette, $, _) ->

  class @Success extends Backbone.Marionette.ItemView
    template: CPT['globals/modals/success']
    className: 'success-modal'
      
    events:
      'click .js-done' : 'closeModal'

    closeModal: ->
      CP.modalRegion.close()

    