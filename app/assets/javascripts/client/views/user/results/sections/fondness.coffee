CP.module "Views.User.Results.Sections", (Sections, CP, Backbone, Marionette, $, _) ->

  class @Fondness extends CP.Views.Common.User.ResultsBase
    name: "Fondness & Admiration"
    questionnaire: 3
    scoresUrl: -> ['/api', 'users', CP.CurrentUser.get('id'), 'scores', @questionnaire].join('/')
    contentUrl: -> ['/api', 'users', CP.CurrentUser.get('id'), 'content', @questionnaire].join('/')
