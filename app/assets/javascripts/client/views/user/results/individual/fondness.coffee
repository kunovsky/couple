CP.module "Views.User.Results.Individual", (Individual, CP, Backbone, Marionette, $, _) ->

  class @Fondness extends CP.Views.Common.User.ResultsBase
    name: "Fondness & Admiration"
    url: -> ['/api', 'users', CP.CurrentUser.get('id'), 'results', '3'].join('/')
