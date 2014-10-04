CP.module "Views.Common.User.Results", (Results, CP, Backbone, Marionette, $, _) ->

  class @Scores extends Backbone.Marionette.ItemView
    template: CPT['common/results/scores']

    initialize: (@options = options = {}) ->
      @url = @options.url
      @name = @options.name
      @results = {}
      @fetchScores()

    onRender: ->
      @setPercentageColors()
      @setPercentageWidths()

    templateHelpers: ->
      {@name, @results}

    fetchScores: ->
      $.ajax
        method: 'GET'
        url: @url
        success: (response) =>
          @results = @formatScores(response)
          @render()

    formatScores: (response) ->
      currentUserPercentage = response.percentage_data.current_user_percentage
      partnerPercentage = response.percentage_data.partner_percentage

      return {currentUserPercentage: currentUserPercentage,
      partnerPercentage: partnerPercentage,
      status: response.status,
      }

    setPercentageColors: ->
      $(@el).find('.js-current-user-percentage').addClass("result--#{@results.status}")
      $(@el).find('.js-partner-percentage')?.addClass("result--#{@results.status}")

    setPercentageWidths: ->
      userWitdh = @determineWidth(@results.currentUserPercentage)
      @animate $(@el).find('.js-current-user-percentage'), userWitdh

      if partnerWidth = @determineWidth(@results.partnerPercentage)
        @animate $(@el).find('.js-partner-percentage'), partnerWidth

    determineWidth: (percentage) -> if percentage > 55 then "#{percentage-26}%" else "25%"

    animate: (element, width) -> element.animate {width: width}, "slow"