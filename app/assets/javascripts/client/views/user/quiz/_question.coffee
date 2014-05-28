CP.module "Views.Quiz", (Quiz, App, Backbone, Marionette, $, _) ->

  class @Question extends Marionette.ItemView
    template: CPT["user/quiz/survey/question"]
    className: 'question-content'
    events:
      'click .btn.btn-blue' : 'indentButton'


    templateHelpers: ->
      possibleResponses = @model.possibleResponses.toJSON()
      return {possibleResponses}

    initialize: ->
      @model.fetchPossibleResponses
        success: (resp) => 
          @render()

    indentButton: (e) ->
      target = $(e.target)
      target.addClass("btn-active")
      target.siblings().removeClass("btn-active")
      @model.createActualResponse target.data()

