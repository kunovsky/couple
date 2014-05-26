CP.module "Views.Quiz", (Quiz, App, Backbone, Marionette, $, _) ->

  class @Question extends Marionette.ItemView
    template: CPT["user/quiz/survey/question"]
    className: 'question-content'


    templateHelpers: ->
      @possibleResponses = @model.possibleResponses
      return {@possibleResponses}     

    formatResponses: (possibleResponse) ->
      console.log possibleResponse.models.get(0)