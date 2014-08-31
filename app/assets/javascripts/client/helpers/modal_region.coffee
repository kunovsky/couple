class CP.ModalRegionStruct extends Backbone.Marionette.Region
  el: '#modal-container .modal'

  initialize: ->
    $(window).resize =>
      if @$el?.is(':visible')
        @positionView() 
        @checkSizing()
        @centerView()

  open: (view) ->
    @positionView()
    @$view = view.$el
    @$el.html @$view
    @$el.parents('#modal-container').fadeIn('fast') unless @$el.parents('#modal-container').is(':visible')
    @checkSizing()
    @centerView()
    window.setTimeout((-> $('#site-container, #js-attach-footer').addClass 'modal-open'), 200) unless $('#site-container').hasClass('modal-open')
    

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

  checkSizing: ->
    return true #Still working on this.
    viewHeight   = @$view.outerHeight() 
    windowHeight = $(window).height()
    if viewHeight > (windowHeight - 10)
      @$view.css maxHeight: (windowHeight - 10)
    else
      @$view.css maxHeight: 'auto'

  show: (view, options = {}) ->
    @ensureEl()
    isViewClosed = view.isClosed or _.isUndefined(view.$el)
    isDifferentView = view isnt @currentView

    @close(noFade: true) if isDifferentView && !options.showInPlace

    view.render()
    @open(view) if isDifferentView or isViewClosed

    @currentView = view

    Marionette.triggerMethod.call @, "show", view
    Marionette.triggerMethod.call view, "show"

  close: (options = {}) ->
    $('#site-container, #js-attach-footer').removeClass 'modal-open'
    @$el.parents('#modal-container').fadeOut('fast', => ModalRegionStruct.__super__.close.apply(@)) unless options.noFade