CP.module "Views.User.Welcome.MoreInfo.Modals", (Modals, CP, Backbone, Marionette, $, _) ->

  class @Base extends Marionette.ItemView
    events: 'click .js-modal-close' : 'closeModal'

    closeModal: (e) ->
      e.preventDefault()
      CP.modalRegion.close()
