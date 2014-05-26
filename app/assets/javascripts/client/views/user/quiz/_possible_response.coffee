CP.module "Views.Quiz", (Quiz, App, Backbone, Marionette, $, _) ->

  class @PossibleResponse extends Marionette.ItemView
    template: CPT["user/quiz/survey/possible_response"]
    className: 'possible-response-content'