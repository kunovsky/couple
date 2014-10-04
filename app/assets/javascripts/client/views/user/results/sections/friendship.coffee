CP.module "Views.User.Results.Sections", (Sections, CP, Backbone, Marionette, $, _) ->

  class @Friendship extends CP.Views.Common.User.ResultsBase
    name: "Friendship"
    questionnaire: 2
    scoresUrl: -> ['/api', 'users', CP.CurrentUser.get('id'), 'scores', @questionnaire].join('/')
    contentUrl: -> ['/api', 'users', CP.CurrentUser.get('id'), 'content', @questionnaire].join('/')

