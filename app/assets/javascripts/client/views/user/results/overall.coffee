CP.module "Views.User.Results", (Results, CP, Backbone, Marionette, $, _) ->

  class @Overall extends CP.Views.Common.User.ResultsBase
    template: CPT["user/results/overall"]
    name: "Overall"
    events: "click .js-invite-partner" : "handlePartnerInvite"

    url: -> ['/api', 'users', CP.CurrentUser.get('id'), 'results', CP.Settings.lastQuestionnaireNumber+1 ].join('/')

    handlePartnerInvite: ->
      console.log "inviting"
      CP.ModalRegion.show new Results.Invite