CP.module "Views.Common.User.Results", (Results, CP, Backbone, Marionette, $, _) ->

  class @Content extends Backbone.Marionette.ItemView
    template: CPT['common/results/content']

    initialize: (@options = options = {}) ->
      @url = @options.url
      @results = {}
      @fetchContent()

    onRender: ->
      @setResultIcon()

    templateHelpers: ->
      {@name, @results}

    fetchContent: ->
      $.ajax
        method: 'GET'
        url: @url
        success: (response) =>
          @results = @formatResponse(response)
          @render()

    formatResponse: (response) ->

      products = response.products_data

      return {content: response.content,
      recommendation: response.recommendation,
      products_data: products,
      status: response.status,
      }

    setResultIcon: ->
      $(@el).find('.js-icon').addClass("icon-#{@results.status}").addClass("result--#{@results.status}--icon")