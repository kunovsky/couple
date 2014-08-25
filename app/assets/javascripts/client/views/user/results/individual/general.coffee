CP.module "Views.User.Results.Individual", (Individual, CP, Backbone, Marionette, $, _) ->

  class @General extends CP.Views.Common.User.ResultsBase
    name: "General Relationship Happiness"
    url: -> ['..', 'api', 'relationships', '1', 'results', '1'].join('/')

