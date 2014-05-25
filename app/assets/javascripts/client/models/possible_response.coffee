CP.module "Models", (Models, App, Backbone, Marionette, $, _) ->

  class @PossibleResponse extends Backbone.Model
  
  class @PossibleResponses extends Backbone.Collection
    model: Models.PossibleResponse
    
    initialize: (@options = options = {}) ->
      @url = "api/surveys/#{@options.sId}/questions/#{qId}/possible_responses"
