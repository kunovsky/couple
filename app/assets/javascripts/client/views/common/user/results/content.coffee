CP.module "Views.Common.User.Results", (Results, CP, Backbone, Marionette, $, _) ->

  class @Content extends Backbone.Marionette.ItemView
    template: CPT['common/results/content']
    events:
      'click .js-resource-link' : 'displayResource'

    initialize: (@options = options = {}) ->
      @url = @options.url
      @name = @options.name
      @results = {}
      @listenToOnce @, 'render', @fetchContent

    onRender: ->
      @setResultIcon()

    templateHelpers: ->
      {@name, @results}

    fetchContent: ->
      @startLoading()
      $.ajax
        method: 'GET'
        url: @url
        success: (response) =>
          @results = @formatResponse(response)
          @render()

    startLoading: ->
      @$el.find('.js-page-container').html("")

    formatResponse: (response) ->

      products = response.products_data

      return {content: response.content,
      recommendation: response.recommendation,
      products_data: products,
      status: response.status,
      }

    setResultIcon: ->
      $(@el).find('.js-icon').addClass("icon-#{@results.status}").addClass("result--#{@results.status}--icon")

    displayResource: (e) ->
      productId = $(e.target).data('product-id') or $(e.target).parent().data('product-id')
      CP.ActiveRouters.User.navigate ['/user', 'resources', productId].join('/') , true