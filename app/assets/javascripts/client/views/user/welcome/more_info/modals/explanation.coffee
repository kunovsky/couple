CP.module "Views.User.Welcome.MoreInfo.Modals", (Modals, CP, Backbone, Marionette, $, _) ->

  class @Explanation extends Marionette.ItemView
    template: CPT["user/welcome/more_info/modals/explanation"]
    events: 'click .js-modal-close' : 'closeModal'

    closeModal: (e) ->
      e.preventDefault()
      CP.modalRegion.close()
