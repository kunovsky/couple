CP.module "Views.Common.User.Results", (Results, CP, Backbone, Marionette, $, _) ->

  class @Scores extends Backbone.Marionette.ItemView
    template: CPT['common/results/scores']

    initialize: (@options = options = {}) ->
      @url = @options.url
      @name = @options.name
      @results = {}
      @listenToOnce @, 'render', @fetchScores

    onRender: ->
      @setPercentageColors()
      @setPercentageWidths()

    templateHelpers: ->
      {@name, @results}

    fetchScores: ->
      @startLoading()
      $.ajax
        method: 'GET'
        url: @url
        success: (response) =>
          @results = @formatScores(response)
          @render()

    startLoading: ->
      @$el.find('.js-page-container').html(CPT['partials/_loading_overlay'](@))
      new Spinner(CP.Mixins.UI.Spinner.Settings).spin($(@el).find('.js-loading-spinner')[0])

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

    determineWidth: (percentage) -> if percentage > 10 then "#{percentage}%" else "10%"

    animate: (element, width) -> element.delay(500).animate {width: width}, 2000