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
          @determineNextSteps() if @name == "Overall"
          @render()

    formatResponse: (response) ->
      currentUserPercentage = @currentUserPercentage(response)
      partnerPercentage = @partnerPercentage(response)
      products = @formatProductData(response)

      {content: response.content,
      recommendation: response.recommendation,
      currentUserPercentage: currentUserPercentage,
      partnerPercentage: partnerPercentage,
      products_data: products,
      status: response.status,
      partnerInvited: response.partner_invited}

    currentUserPercentage: (response) ->
      response.percentage_data.current_user_percentage

    partnerPercentage: (response) ->
      response.percentage_data.partner_percentage

    formatProductData: (response) ->
      response.products_data

    colorizeResult: ->
      target = $(@el).find(".result__container")
      return target.addClass("result--good") if @results.status == "g"
      return target.addClass("result--ok") if @results.status == "o"
      target.addClass("result--bad")