CP.module "Views.User.Quiz", (Quiz, CP, Backbone, Marionette, $, _) ->

  class @OverallHappiness extends CP.Views.Common.User.QuizBase
    template: CPT["common/questionnaire"]
