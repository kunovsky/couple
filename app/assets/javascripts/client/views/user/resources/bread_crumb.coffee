CP.module "Views.User.Resources", (Resources, CP, Backbone, Marionette, $, _) ->

  class @BreadCrumb  extends Backbone.Marionette.ItemView
    template: CPT["user/resources/bread_crumb"]
    className: "results-sub-menu"
    url: "/results/sections"
    events:
      'click li' : 'backToResults'

    onRender: -> $(@el).scrollTop (1000)

    backToResults: (e) ->
      e.preventDefault()
      CP.ActiveRouters.User.navigate @url, true