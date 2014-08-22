CP.module "Views.User.Results", (Results, CP, Backbone, Marionette, $, _) ->

  class @Overall extends CP.Views.Common.User.ResultsBase
    template: CPT["user/results/overall"]
    name: "Overall"
    url: -> ['..', 'api', 'relationships', '1', 'results', '1'].join('/')

    