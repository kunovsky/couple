CP.module "Views.User.Results.Individual", (Individual, CP, Backbone, Marionette, $, _) ->

  class @Friendship extends CP.Views.Common.User.ResultsBase
    name: "Friendship"