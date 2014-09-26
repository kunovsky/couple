CP.module "Views.User.Welcome.MoreInfo.Modals", (Modals, CP, Backbone, Marionette, $, _) ->

  class @Process extends Marionette.ItemView
    template: CPT["user/welcome/more_info/modals/process"]
    events: 'click .js-modal-close' : 'closeModal'

    closeModal: (e) ->
      e.preventDefault()
      CP.modalRegion.close()
