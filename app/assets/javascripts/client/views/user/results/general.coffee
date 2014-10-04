CP.module "Views.User.Results", (Results, CP, Backbone, Marionette, $, _) ->

  class @General extends CP.Views.Common.User.ResultsBase
    name: "General Happiness"
    url: -> ['/api', 'users', CP.CurrentUser.get('id'), 'results', '1'].join('/')