CP.module "Views.User.Section", (Section, CP, Backbone, Marionette, $, _) ->

  class @Grouping extends Marionette.ItemView
    template: CPT["common/questionnaire"]

    events: 
      'click .js-response-button'           : 'setActualResponse'
      'click .js-next-questionnaire-button' : 'createCompletedQuestionnaire'

    initialize: (@options = options = {}) ->
      @url = ['/api', 'grouping', @options.id].join('/')
  
      @fetchCollection()
      @questions = []

    templateHelpers: ->
      sectionData = @sectionData()
      return {@questions, sectionData}

    saveUrl: -> ['/api','users', CP.CurrentUser.get('id'), 'actual_responses'].join('/')
    scoreResultsUrl: ->['/api', 'users', CP.CurrentUser.get('id'), 'score'].join('/')
    completedSurveyUrl: ->['/api','users', CP.CurrentUser.get('id'), 'completed_questionnaires'].join('/')

    setActualResponse: (e) ->
      e.preventDefault()
      target = $(e.target)
      @handleButtonState(target)
      data = @handleRequestData(target)
      @saveActualResponse(data)

    fetchCollection: (range) ->
      $.ajax
        type: 'GET'
        url: @url
        success: (response) =>
          @questions = response
          @render()

    saveActualResponse: (data) ->
      $.ajax
        type: 'POST'
        url: @saveUrl()
        data: data
        success: (respObj) =>
          if respObj.completed
            @sectionCompleted = true
            @enableNextSection()
        error: (respObj) => @logout(respObj.path)

    createCompletedQuestionnaire: ->
      return unless @sectionCompleted

      $.ajax
        type: 'POST'
        url: @completedSurveyUrl()
        data: {grouping_id: @options.id}
        success: => @handleNextSection()
        error: (respObj) => @logout(respObj.path)

    handleProcessCompletion: ->
      $.ajax
        type: 'POST'
        url: @scoreResultsUrl()
        success: => @nextSection()

    handleNextSection: ->
      if (@nextGroupingNumber() < (CP.Settings.lastGroupingNumber + 1)) then return @nextSection() 
      @handleProcessCompletion()

    enableNextSection: ->
      $(@el).find('.next-questionnaire-button').attr('disabled', false)

    nextGroupingNumber: -> Number(@options.id) + 1

    handleButtonState: (target) ->
      target.addClass('selected').removeClass('purple').siblings().removeClass('selected').addClass('purple')

    handleRequestData: (target) ->
      {response_id: target.data('rid'), question_id: target.data('qid')}

    nextSection: -> CP.ActiveRouters.User.navigate @nextSectionUrl(), true

    nextSectionUrl: ->
      return 'results' if @nextGroupingNumber() > CP.Settings.lastGroupingNumber
      ['grouping', @nextGroupingNumber()].join('/')

    logout: (path) ->
      CP.ActiveRouters.User.navigate path
      window.location.href = ''

    sectionData: -> [@options.id, 'of', CP.Settings.lastGroupingNumber].join(' ')