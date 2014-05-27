CP.module "Views.Quiz", (Quiz, App, Backbone, Marionette, $, _) ->

  class @Question extends Marionette.ItemView
    template: CPT["user/quiz/survey/question"]
    className: 'question-content'

    templateHelpers: ->
      possibleResponses = @model.possibleResponses.toJSON()
      return {possibleResponses}

    initialize: ->
      @model.fetchResponses
        success: (resp) => 
          @render()

