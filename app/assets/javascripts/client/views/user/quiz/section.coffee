CP.module "Views.User.Quiz", (Quiz, CP, Backbone, Marionette, $, _) ->

  class @Section extends Marionette.CompositeView
    itemView: Quiz.Question
    template: CPT["common/questionnaire"]