CP.module "Views.User.Results.Individual", (Individual, CP, Backbone, Marionette, $, _) ->

  class @Fondness extends CP.Views.Common.User.ResultsBase
    name: "Fondness & Admiration"
    url: -> ['..', 'api', 'relationships', '1', 'results', '3'].join('/')
