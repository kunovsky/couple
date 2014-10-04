CP.module "Views.User.Results.Invites", (Invites, CP, Backbone, Marionette, $, _) ->
  
  class @NotifySelf extends CP.Views.Globals.Modals.InviteBase
    template: CPT["user/results/invites/notify_self"]
    className: 'success-modal'
    events: 
      "click .js-invite" : "inviteSelf"
      "click .js-cancel" : "closeModal"

    url: -> ['/api', 'users', CP.CurrentUser.get('id'), 'notification'].join('/')

    inviteSelf: (e) ->
      @clearErrors()
      e.preventDefault()
      data = $(@el).formParams()
      return @handleError() if @invalidValue(data)

      $.ajax
        url: @url()
        type: 'POST'
        data: data
        success: => CP.modalRegion.show new CP.Views.Globals.Modals.Finished
        error: => @handleError()