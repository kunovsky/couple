CP.module "Views.Common.User", (User, CP, Backbone, Marionette, $, _) ->

  class @ResultsBase extends Marionette.ItemView
    template: CPT['common/result']
    className: 'result'

    initialize: ->
      @results = {}
      @fetchResult()

    templateHelpers: ->
      @individual = !@results.partner2Percentage
      {@name, @results, @individual}

    onRender: ->
      @colorizeResult() if @results.status
        
    fetchResult: ->
      $.ajax
        method: 'GET'
        url: @url()
        success: (response) =>
          @results = @formatResponse(response)
          @render()

    formatResponse: (response) ->
      partner1 = @partner1(response)
      partner2 = @partner2(response)
      products = @formatProductData(response)

      {content: response.content, 
      recommendation: response.recommendation, 
      partner1Percentage: partner1, 
      partner2Percentage: partner2, 
      products_data: products, 
      status: response.status}

    partner1: (response) ->
      response.percentage_data.partner_1_percentage

    partner2: (response) ->
      response.percentage_data.partner_2_percentage

    formatProductData: (response) ->
      response.products_data

    colorizeResult: ->
      target = $(@el).find(".result__container")
      return target.addClass("result--good") if @results.status == "g"
      return target.addClass("result--ok") if @results.status == "o"
      target.addClass("result--bad")
