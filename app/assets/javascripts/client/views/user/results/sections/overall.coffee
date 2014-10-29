CP.module "Views.User.Results.Sections", (Sections, CP, Backbone, Marionette, $, _) ->

  class @Overall extends CP.Views.Common.User.ResultsBase
    name: "Your Relationship Overall"
    scoresUrl: -> ['/api', 'users', CP.CurrentUser.get('id'), 'scores', CP.Settings.lastQuestionnaireNumber+1 ].join('/')
    contentUrl: -> ['/api', 'users', CP.CurrentUser.get('id'), 'content', CP.Settings.lastQuestionnaireNumber+1 ].join('/')