CP.module "Views.User.Resources", (Resources, CP, Backbone, Marionette, $, _) ->

  class @BreadCrumb  extends Backbone.Marionette.ItemView
    template: CPT["user/resources/bread_crumb"]
    className: "results-sub-menu"
    url: ['/user', 'results', 'sections'].join("/")
    message: "Your Results"
    events:
      'click li' : 'backToResults'

    initialize: ->
      @selectBreadCrumbType()

    onRender: -> $(@el).scrollTop (1000)

    templateHelpers: ->
      {@message}

    selectBreadCrumbType: ->
      switch CP.Settings.breadCrumbResults
        when false
          @url = ['/user', 'results', 'resources'].join("/")
          @message = "All Resources"

    backToResults: (e) ->
      e.preventDefault()
      CP.ActiveRouters.User.navigate @url, true