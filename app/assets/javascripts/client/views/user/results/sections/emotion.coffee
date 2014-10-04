CP.module "Views.User.Results.Sections", (Sections, CP, Backbone, Marionette, $, _) ->

  class @Emotion extends CP.Views.Common.User.ResultsBase
    name: "Emotional Connectivity"
    questionnaire: 5
    scoresUrl: -> ['/api', 'users', CP.CurrentUser.get('id'), 'scores', @questionnaire].join('/')
    contentUrl: -> ['/api', 'users', CP.CurrentUser.get('id'), 'content', @questionnaire].join('/')