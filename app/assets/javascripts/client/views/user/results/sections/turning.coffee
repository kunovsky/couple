CP.module "Views.User.Results.Sections", (Sections, CP, Backbone, Marionette, $, _) ->

  class @Turning extends CP.Views.Common.User.ResultsBase
    name: "Turning Towards"
    questionnaire: 4
    scoresUrl: -> ['/api', 'users', CP.CurrentUser.get('id'), 'scores', @questionnaire].join('/')
    contentUrl: -> ['/api', 'users', CP.CurrentUser.get('id'), 'content', @questionnaire].join('/')