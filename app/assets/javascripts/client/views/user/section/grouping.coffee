CP.module "Views.User.Section", (Section, CP, Backbone, Marionette, $, _) ->

  class @Grouping extends Marionette.ItemView
    template: CPT["common/grouping"]

    events: 
      'click .js-response-button'              : 'setActualResponse'
      'click .js-next-grouping-button'         : 'createCompletedQuestionnaire'

    #TODO: break this down to use composition (all ajax one file)
    initialize: (@options = options = {}) ->
      @url = ['/api', 'grouping', @options.id].join('/')
      @fetchCollection()
      @questions = []

    onRender: -> @fillExistingResponses()

    templateHelpers: ->
      sectionData = @sectionData()
      totalQuestions = CP.Settings.totalQuestionCount
      return {@questions, sectionData, totalQuestions, @totalAnswered}

    saveUrl: -> ['/api','users', CP.CurrentUser.get('id'), 'actual_responses'].join('/')
    scoreResultsUrl: ->['/api', 'users', CP.CurrentUser.get('id'), 'score'].join('/')
    completedSurveyUrl: ->['/api','users', CP.CurrentUser.get('id'), 'completed_questionnaires'].join('/')

    fillExistingResponses: ->
      return if !@actualResponses
      answered = 0
  
      for responseSet in @actualResponses
        for key, value of responseSet
          answered+=1
          @handleButtonState parent if parent = $(@el).find("[data-qid=\"#{key}\"]").parent().find("[data-rid=\"#{value}\"]")

      @additionalSetup(answered)

    additionalSetup: (answered) ->
      @updateProgress()
      @sectionCompleted = true if answered == @questions.length
      @enableNextSection() if @sectionCompleted

    fetchCollection: (range) ->
      $.ajax
        type: 'GET'
        url: @url
        success: (response) =>
          #TODO: actual response and total answered need to be moved to a different ajax call
          @questions = _.shuffle(response.questions)
          @actualResponses = response.actual_responses
          @totalAnswered = response.total_answered
          @render()

    setActualResponse: (e) ->
      e.preventDefault()
      target = $(e.target)
      data = @handleRequestData(target)
      @saveActualResponse(data, target)

    saveActualResponse: (data, target) ->
      $.ajax
        type: 'POST'
        url: @saveUrl()
        data: data
        success: (response) =>
          @handleButtonState(target)
          @totalAnswered = response.total_answered
          @updateProgress()
          if response.completed
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

    nextGroupingNumber: -> parseInt(@options.id) + 1

    handleButtonState: (target) ->
      target.addClass('selected').removeClass('purple').siblings().removeClass('selected').addClass('purple')
      target.parent().next().addClass('icon-good result--good--icon')

    updateProgress: -> $(@el).find('.js-answered').text(@totalAnswered)

    handleRequestData: (target) -> {response_id: target.data('rid'), question_id: target.data('qid')}

    nextSection: -> CP.ActiveRouters.User.navigate @nextSectionUrl(), true

    nextSectionUrl: ->
      return ['/user', 'results'].join ('/') if @nextGroupingNumber() > CP.Settings.lastGroupingNumber
      ['/user','grouping', @nextGroupingNumber()].join('/')

    sectionData: -> [@options.id, 'of', CP.Settings.lastGroupingNumber].join(' ')