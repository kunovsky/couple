CP.module "Views.Quiz", (Quiz, App, Backbone, Marionette, $, _) ->

  class @Question extends Marionette.ItemView
    tmeplate: CPT["user/quiz/question"]
    className: 'question-content'