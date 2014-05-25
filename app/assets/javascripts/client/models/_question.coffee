CP.module "Models", (Models, App, Backbone, Marionette, $, _) ->

  class @Question extends Backbone.Model
    urlRoot: -> "api/questions/#{@get('id')}"

    initialize: (question) ->
      @options = {}
      _.map @options.sId = question?.survey_id
      console.log @options
     