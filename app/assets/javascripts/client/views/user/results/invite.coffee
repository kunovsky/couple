CP.module "Views.User.Results", (Results, CP, Backbone, Marionette, $, _) ->

  class @Invite extends Backbone.Marionette.ItemView
    template: CPT["user/results/invite"]
    events: 
      "click .js-invite" : "invitePartner"
      "click .js-cancel" : "closeModal"
      
    invitePartner: (e) ->
      e.preventDefault()
      CP.modalRegion.close()
      
    closeModal: (e) ->
      e.preventDefault()
      CP.modalRegion.close()