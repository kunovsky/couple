CP.module "Views.User.Quiz", (Quiz, CP, Backbone, Marionette, $, _) ->

  class @FondnessAdmiration extends CP.Views.Common.User.QuizBase
    template: CPT["common/questionnaire"]