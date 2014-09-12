CP.module "Views.Globals.Modals", (Modals, CP, Backbone, Marionette, $, _) ->

  class @Finished extends Backbone.Marionette.ItemView
    template: CPT['globals/modals/finished']
    className: 'finished-modal'
      
    events:
      'click .js-done' : 'closeModal'

    closeModal: ->
      CP.modalRegion.close()