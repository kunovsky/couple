CP.module "Views.User.Welcome", (Welcome, CP, Backbone, Marionette, $, _) ->

  class @Layout extends Marionette.Layout
    template: CPT["user/welcome/layout"]

    regions:
      helloRegion: "#hello-region"
      explinationRegion: "#explination-region"
      disclaimerRegion: "#disclaimer-region"


    onRender: ->
      @helloRegion.show new Welcome.Hello
      @explinationRegion.show new Welcome.Explination
      @disclaimerRegion.show new Welcome.Disclaimer