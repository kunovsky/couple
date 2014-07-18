CP.module "Views.User.Quiz", (Quiz, CP, Backbone, Marionette, $, _) ->

  class @Question extends Marionette.CompositeView
    template: CPT["user/quiz/question"]