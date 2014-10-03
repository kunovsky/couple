CP.module "Views.User.Results.Overall", (Overall, CP, Backbone, Marionette, $, _) ->

  class @Result extends CP.Views.Common.User.ResultsBase
    template: CPT["user/results/overall/result"]
    name: "Overall Result"
    url: -> ['/api', 'users', CP.CurrentUser.get('id'), 'results', CP.Settings.lastQuestionnaireNumber+1 ].join('/')

    fetchResult: ->
      $.ajax
        method: 'GET'
        url: @url()
        success: (response) =>
          @results = @formatResponse(response)
          @determineNextSteps()
          @render()

    determineNextSteps: ->
      return CP.vent.trigger 'show:next', {inviteOptions: true} if !@results.partnerInvited
      CP.vent.trigger 'show:next', {partnerInvited: true} if !@results.partnerPercentage