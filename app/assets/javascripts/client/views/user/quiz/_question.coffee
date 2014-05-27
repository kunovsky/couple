CP.module "Views.Quiz", (Quiz, App, Backbone, Marionette, $, _) ->

  class @Question extends Marionette.ItemView
    template: CPT["user/quiz/survey/question"]
    className: 'question-content'

    initialize: ->
      options = {sId: 1, qId: @model.id}
      @foo = new CP.Models.PossibleResponses options
      @foo.fetch
        success: =>
        console.log @foo.models[1]

    templateHelpers: ->
      console.log "here"
      @possibleResponses = @model.foo
      return {@possibleResponses}

