CP.module "Views.User.Results.Overall", (Overall, CP, Backbone, Marionette, $, _) ->
  
  class @InviteOptions extends Backbone.Marionette.ItemView
    template: CPT["user/results/overall/invite_options"]
    events: 
      "click .js-invite-partner"  : "handlePartnerInvite"
      "click .js-take-as-partner" : "takeAsPartner"

    onRender: ->
      $(@el).find(".invite__container").addClass("result--bad")

    handlePartnerInvite: (e) ->
      e.preventDefault()
      CP.modalRegion.show new Overall.Invite $(e.target).data()

    takeAsPartner: ->
      $.ajax
        url: ['api', 'users'].join('/')
        type: "POST"
        success: (respObj) =>
          window.location.href = respObj.path