CP.module "Views.User.Quiz", (Quiz, CP, Backbone, Marionette, $, _) ->

  class @Section extends Marionette.ItemView
    template: CPT["common/questionnaire"]

    events: 
      'click .js-response-button'           : 'setActualResponse'
      'click .js-next-questionnaire-button' : 'createCompletedQuestionnaire'

    initialize: (@options = options = {}) ->
      @url = ['/api', 'questionnaires', @options.id].join('/')
  
      @fetchCollection()
      @questions = []

    templateHelpers: -> {questions: @questions}

    saveUrl: -> ['/api','users', CP.CurrentUser.get('id'), 'actual_responses'].join('/')
    scoreResultsUrl: ->['/api', 'users', CP.CurrentUser.get('id'), 'score'].join('/')
    completedSurveyUrl: ->['/api','users', CP.CurrentUser.get('id'), 'completed_questionnaires'].join('/')

    setActualResponse: (e) ->
      e.preventDefault()
      @handleButtonState($(e.target))
      data = @handleRequestData($(e.target))
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
        success: (respObj) => @enableNextSection() if respObj.completed
        error: (respObj) => @logout(respObj.path)

    createCompletedQuestionnaire: ->
      $.ajax
        type: 'POST'
        url: @completedSurveyUrl()
        data: {questionnaire_id: @options.id}
        success: => @handleNextSection()
        error: (respObj) => @logout(respObj.path)

    handleProcessCompletion: ->
      $.ajax
        type: 'POST'
        url: @scoreResultsUrl()
        success: => @nextSection()

    handleNextSection: ->
      if (@nextQuestionnaireNumber() < (CP.Settings.lastQuestionnaireNumber + 1)) then return @nextSection() 
      @handleProcessCompletion()

    enableNextSection: ->
      $(@el).find('.next-questionnaire-button').attr('disabled', false)

    nextQuestionnaireNumber: -> Number(@options.id) + 1

    handleButtonState: (target) ->
      target.attr("disabled","disabled").siblings().attr("disabled", false)

    handleRequestData: (target) ->
      {response_id: target.data('rid'), question_id: target.data('qid'), questionnaire_id: @options.id}

    nextSection: -> CP.ActiveRouters.User.navigate @nextSectionUrl(), true

    nextSectionUrl: ->
      return 'results' if @nextQuestionnaireNumber() > CP.Settings.lastQuestionnaireNumber
      ['questionnaire', @nextQuestionnaireNumber()].join('/')

    logout: (path) ->
      CP.ActiveRouters.User.navigate path
      window.location.href = ''