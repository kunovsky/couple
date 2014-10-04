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
      @setPercentageColors()
      @setPercentageWidths()
      @setResultIcon()
        
    fetchResult: ->
      $.ajax
        method: 'GET'
        url: @url()
        success: (response) =>
          @results = @formatResponse(response)
          @render()

    formatResponse: (response) ->

      currentUserPercentage = response.percentage_data.current_user_percentage
      partnerPercentage = response.percentage_data.partner_percentage
      products = response.products_data

      return {content: response.content,
      recommendation: response.recommendation,
      currentUserPercentage: currentUserPercentage,
      partnerPercentage: partnerPercentage,
      products_data: products,
      status: response.status,
      partnerInvited: response.partner_invited}

    setPercentageColors: ->
      $(@el).find('.js-current-user-percentage').addClass("result--#{@results.status}")
      $(@el).find('.js-partner-percentage')?.addClass("result--#{@results.status}")

    setPercentageWidths: ->
      userWitdh = @determineWidth(@results.currentUserPercentage)
      @animate $(@el).find('.js-current-user-percentage'), userWitdh

      if partnerWidth = @determineWidth(@results.partnerPercentage)
        @animate $(@el).find('.js-partner-percentage'), partnerWidth

    setResultIcon: ->
      $(@el).find('.js-icon').addClass("icon-#{@results.status}").addClass("result--#{@results.status}--icon")

    determineWidth: (percentage) -> if percentage > 55 then "#{percentage-26}%" else "25%"

    animate: (element, width) -> element.animate {width: width}, "slow"