CP.module "Views.User.Results", (Results, CP, Backbone, Marionette, $, _) ->

  class @SubMenu  extends Backbone.Marionette.ItemView
    template: CPT["user/results/sub_menu"]
    className: "results-sub-menu"
    events:
      'click li' : 'navigate'

    initialize: (@options = options = {}) ->

    onRender: ->
      @setBreadCrumbLink(@options.active)
      @$el.find("li[data-link='#{@options.active}']").addClass('active').siblings().removeClass('active')
      $(@el).scrollTop (1000)

    navigate: (e) ->
      page = $(e.target).data('link')
      CP.ActiveRouters.User.navigate ['/user','results', page].join('/'), true

    setBreadCrumbLink: (page) ->
      switch page
        when 'sections'
          CP.Settings.breadCrumbResults = true
        when 'resources'
          CP.Settings.breadCrumbResults = false