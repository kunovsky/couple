CP.module "Models", (Models, App, Backbone, Marionette, $, _) ->

  class @Question extends Backbone.Model

    initialize: (question) ->
      options = {sId: question?.survey_id, qId: question?.id}
      @possibleResponses = new CP.Models.PossibleResponses options
      if options.sId? && options.qId
        @possibleResponses.fetch()
        
  class @Survey extends Backbone.Collection
    model: Models.Question
    
    initialize: (path) ->
      @url = "api/surveys/1"
