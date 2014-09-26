CP.module "Views.User.Welcome.MoreInfo.Modals", (Modals, CP, Backbone, Marionette, $, _) ->

  class @Research extends Marionette.ItemView
    template: CPT["user/welcome/more_info/modals/research"]
    events: 'click .js-modal-close' : 'closeModal'

    closeModal: (e) ->
      e.preventDefault()
      CP.modalRegion.close()
