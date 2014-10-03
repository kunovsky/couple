CP.module "Views.User.Results", (Results, CP, Backbone, Marionette, $, _) ->

  class @Friendship extends CP.Views.Common.User.ResultsBase
    name: "Friendship"
    url: -> ['/api', 'users', CP.CurrentUser.get('id'), 'results', '2'].join('/')

