CP.module "Views.Quiz", (Quiz, App, Backbone, Marionette, $, _) ->

  class @Question extends Marionette.ItemView
    template: CPT["user/quiz/global/question"]
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
      @saveActualResponse(target.data())
      
    saveActualResponse: (data) ->
      @model.createActualResponse data

