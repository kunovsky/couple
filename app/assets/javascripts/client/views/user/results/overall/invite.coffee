CP.module "Views.User.Results.Overall", (Overall, CP, Backbone, Marionette, $, _) ->

  class @Invite extends CP.Views.Globals.Modals.InviteBase
    template: CPT["user/results/overall/invite"]
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
          CP.vent.trigger 'show:next', {partnerInvited: true}
          CP.modalRegion.show new CP.Views.Globals.Modals.Success type: @type # Move this to this folder
        error: => @handleError()