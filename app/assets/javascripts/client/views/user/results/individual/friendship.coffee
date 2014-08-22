CP.module "Views.User.Results.Individual", (Individual, CP, Backbone, Marionette, $, _) ->

  class @Friendship extends CP.Views.Common.User.ResultsBase
    name: "Friendship"
    resultStats: []
    url: -> ['..', 'api', 'relationships', '1', 'results', '2'].join('/')

