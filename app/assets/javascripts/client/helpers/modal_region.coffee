class CP.ModalRegionStruct extends Backbone.Marionette.Region
  el: '#modal-container .modal'

  initialize: ->
    $(window).resize =>
      if @$el?.is(':visible')
        @positionView() 
        @centerView()

  open: (view) ->
    @positionView()
    @$view = $(view.el)
    @$el.html @$view
    @$el.parents('#modal-container').fadeIn('fast')
    @centerView()

  positionView: ->
    @$el.parents('#modal-container').css
      'width'  : $(window).width()
      'height' : $(window).height()

    @$el.siblings('.modal-background').css
      'width'  : $(document).width()
      'height' : $(document).height()

  centerView: ->
    left = -(@$el.outerWidth(false) / 2)
    top  = -(@$el.outerHeight(false) / 2)

    @$el.css
      'marginLeft' : left
      'marginTop'  : top

  show: (view) ->
    @ensureEl()
    isViewClosed = view.isClosed or _.isUndefined(view.$el)
    isDifferentView = view isnt @currentView

    @close(noFade: true) if isDifferentView

    view.render()
    @open(view) if isDifferentView or isViewClosed

    @currentView = view

    Marionette.triggerMethod.call @, "show", view
    Marionette.triggerMethod.call view, "show"

  close: (options = {}) ->
    @$el.parents('#modal-container').fadeOut('fast', => ModalRegionStruct.__super__.close.apply(@)) unless options.noFade
