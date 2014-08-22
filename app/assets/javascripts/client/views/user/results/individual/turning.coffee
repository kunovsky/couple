CP.module "Views.User.Results.Individual", (Individual, CP, Backbone, Marionette, $, _) ->

  class @Turning extends CP.Views.Common.User.ResultsBase
    name: "Turning Towards"

    url: -> ['..', 'api', 'relationships', '1', 'results', '4'].join('/')
