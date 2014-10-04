CP.module "Views.User.Results.Sections", (Sections, CP, Backbone, Marionette, $, _) ->

  class @General extends CP.Views.Common.User.ResultsBase
    name: "General Happiness"
    questionnaire: 1
    scoresUrl: -> ['/api', 'users', CP.CurrentUser.get('id'), 'scores', @questionnaire].join('/')
    contentUrl: -> ['/api', 'users', CP.CurrentUser.get('id'), 'content', @questionnaire].join('/')