CP.module "Views.User.Results", (Results, CP, Backbone, Marionette, $, _) ->

  class @Overall extends CP.Views.Common.User.ResultsBase
    template: CPT["user/results/overall"]
    name: "Overall"
    className: "result__container--overall"
    url: -> ['..', 'api', 'relationships', '1', 'results', CP.Settings.lastQuestionnaireNumber+1 ].join('/')

    