CP.module "Views.Common.User", (User, CP, Backbone, Marionette, $, _) ->

  class @ResultsBase extends Marionette.ItemView
    template: CPT['common/result']
    className: 'result'

    initialize: ->
      @fetchResult()

    templateHelpers: ->
      {@name, @content, @percentage}

    fetchResult: ->
      $.ajax
        method: 'GET'
        url: @url()
        success: (response) => 
          @results = @formatResponse(response)
          @render()

    formatResponse: (response) ->
      [@content, @percentage] = [response.content, response.percentage]