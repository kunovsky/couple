CP.module "Views.User.Results.Individual", (Individual, CP, Backbone, Marionette, $, _) ->

  class @Emotion extends CP.Views.Common.User.ResultsBase
    name: "Emotional Connectivity"

    url: -> ['api', 'relationship', '1',].join('/')