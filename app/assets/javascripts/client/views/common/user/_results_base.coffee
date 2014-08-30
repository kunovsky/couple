CP.module "Views.Common.User", (User, CP, Backbone, Marionette, $, _) ->

  class @ResultsBase extends Marionette.ItemView
    template: CPT['common/result']
    className: 'result'

    initialize: ->
      @results = {}
      @fetchResult()

    templateHelpers: ->
      {@name, @results}

    fetchResult: ->
      $.ajax
        method: 'GET'
        url: @url()
        success: (response) => 
          @results = @formatResponse(response)
          @render()

    formatResponse: (response) ->
      percentage_data = @formatPercentage(response)
      products = @formatProductData(response)
      {content: response.content, recommendation: response.recommendation, percentage: percentage_data, products_data: products}

    formatPercentage: (response) ->
      response.percentage_data.partner_1_percentage

    formatProductData: (response) ->
      response.products_data