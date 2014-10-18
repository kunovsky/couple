CP.module "Views.User.Section", (Section, CP, Backbone, Marionette, $, _) ->

  class @Grouping extends Marionette.ItemView
    template: CPT["common/grouping"]

    events: 
      'click .js-response-button'              : 'setActualResponse'
      'click .js-next-grouping-button'         : 'createCompletedQuestionnaire'

    #TODO: break this down to use composition
    initialize: (@options = options = {}) ->
      @url = ['/api', 'grouping', @options.id].join('/')
  
      @fetchCollection()
      @questions = []

    onRender: -> @fillExistingResponses()

    fillExistingResponses: ->
      return if !@actualResponses
      answers = 0

      for key, value of @actualResponses
        answers+=1
        @handleButtonState parent if parent = $(@el).find("[data-qid=\"#{key}\"]").parent().find("[data-rid=\"#{value}\"]")

      @sectionCompleted = true if answers == @questions.length
      @enableNextSection() if @sectionCompleted

    templateHelpers: ->
      sectionData = @sectionData()
      return {@questions, sectionData}

    saveUrl: -> ['/api','users', CP.CurrentUser.get('id'), 'actual_responses'].join('/')
    scoreResultsUrl: ->['/api', 'users', CP.CurrentUser.get('id'), 'score'].join('/')
    completedSurveyUrl: ->['/api','users', CP.CurrentUser.get('id'), 'completed_questionnaires'].join('/')

    setActualResponse: (e) ->
      e.preventDefault()
      target = $(e.target)
      data = @handleRequestData(target)
      @saveActualResponse(data, target)

    fetchCollection: (range) ->
      $.ajax
        type: 'GET'
        url: @url
        success: (response) =>
          @questions = response.questions
          @actualResponses = response.actual_responses
          @render()

    saveActualResponse: (data, target) ->
      $.ajax
        type: 'POST'
        url: @saveUrl()
        data: data
        success: (respObj) =>
          @handleButtonState(target)
          if respObj.completed
            @sectionCompleted = true
            @enableNextSection()

    createCompletedQuestionnaire: ->
      return unless @sectionCompleted

      $.ajax
        type: 'POST'
        url: @completedSurveyUrl()
        data: {grouping_id: @options.id}
        success: => @handleNextSection()

    handleProcessCompletion: ->
      $.ajax
        type: 'POST'
        url: @scoreResultsUrl()
        success: => @nextSection()

    handleNextSection: ->
      if (@nextGroupingNumber() < (CP.Settings.lastGroupingNumber + 1)) then return @nextSection() 
      @handleProcessCompletion()

    enableNextSection: ->
      $(@el).find('.next-grouping-button').attr('disabled', false)
      $(@el).find('.message__container').text('')

    nextGroupingNumber: -> Number(@options.id) + 1

    handleButtonState: (target) ->
      target.addClass('selected').removeClass('purple').siblings().removeClass('selected').addClass('purple')
      target.parent().next().addClass('icon-good result--good--icon')

    handleRequestData: (target) -> {response_id: target.data('rid'), question_id: target.data('qid')}

    nextSection: -> CP.ActiveRouters.User.navigate @nextSectionUrl(), true

    nextSectionUrl: ->
      return 'results' if @nextGroupingNumber() > CP.Settings.lastGroupingNumber
      ['grouping', @nextGroupingNumber()].join('/')

    sectionData: -> [@options.id, 'of', CP.Settings.lastGroupingNumber].join(' ')