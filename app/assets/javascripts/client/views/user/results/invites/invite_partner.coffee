CP.module "Views.User.Results.Invites", (Invites, CP, Backbone, Marionette, $, _) ->

  class @InvitePartner extends CP.Views.Globals.Modals.InviteBase
    template: CPT["user/results/invites/invite_partner"]
    url: ['/api', 'invites'].join('/')
    events:
      "click .js-invite" : "invitePartner"
      "click .js-cancel" : "closeModal"

    invitePartner: (e) ->
      @clearErrors()
      e.preventDefault()
      data = $(@el).formParams()
      return @handleError() if @invalidValue(data)

      $.ajax
        url: @url
        type: 'POST'
        data: data
        success: =>
          CP.vent.trigger 'show:partnerInvited'
          CP.modalRegion.show new Invites.NotifySelf type: @type
        error: => @handleError()