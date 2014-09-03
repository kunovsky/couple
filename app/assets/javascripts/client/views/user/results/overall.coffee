CP.module "Views.User.Results", (Results, CP, Backbone, Marionette, $, _) ->

  class @Overall extends CP.Views.Common.User.ResultsBase
    template: CPT["user/results/overall"]
    name: "Overall"
    events: 
      "click .js-invite-partner"  : "handlePartnerInvite"
      "click .js-take-as-partner" : "takeAsPartner"

    url: -> ['/api', 'users', CP.CurrentUser.get('id'), 'results', CP.Settings.lastQuestionnaireNumber+1 ].join('/')

    handlePartnerInvite: (e) ->
      e.preventDefault()
      CP.modalRegion.show new Results.Invite $(e.target).data()

    takeAsPartner: ->
      $.ajax
        url: ['api', 'users'].join('/')
        type: "POST"
        success: (respObj) =>
          window.location.href = respObj.path

