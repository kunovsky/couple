CP.module "Views.Quiz", (Quiz, App, Backbone, Marionette, $, _) ->

  class @Question extends Marionette.ItemView
    template: CPT["user/quiz/question"]
    className: 'question-content'