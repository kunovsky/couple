CP.module "Views.User.Welcome", (Welcome, CP, Backbone, Marionette, $, _) ->

  class @Layout extends Marionette.Layout
    template: CPT["user/welcome/layout"]

    regions:
      helloRegion: "#hello-region"
      explanationRegion: "#explanation-region"
      disclaimerRegion: "#disclaimer-region"


    onRender: ->
      @helloRegion.show new Welcome.Hello
      @explanationRegion.show new Welcome.Explanation
      @disclaimerRegion.show new Welcome.Disclaimer