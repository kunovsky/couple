CP.module "Views.User.Results", (Results, CP, Backbone, Marionette, $, _) ->

  class @Emotion extends CP.Views.Common.User.ResultsBase
    name: "Emotional Connectivity"
    url: -> ['/api', 'users', CP.CurrentUser.get('id'), 'results', '5'].join('/')