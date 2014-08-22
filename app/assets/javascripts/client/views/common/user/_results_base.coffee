CP.module "Views.Common.User", (User, CP, Backbone, Marionette, $, _) ->

  class @ResultsBase extends Marionette.ItemView
    template: CPT['common/result']
    className: 'result'

    initialize: ->
      @fetchResult()

    templateHelpers: ->
      {@name, @resultsStats?}

    fetchResult: ->
      $.ajax
      method: 'GET'
      url: @url()
      success: (response) =>
        @resultStats = response
        @render()