CP.module "Views.Welcome", (Welcome, App, Backbone, Marionette, $, _) ->

  class @Layout extends Marionette.Layout
    template: CPT["user/welcome/layout"]

    regions:
      helloRegion: "#hello-region"
      explinationRegion: "#explination-region"
      disclaimerRegion: "#disclaimer-region"

    onRender: ->
        @helloRegion.show new CP.Views.Welcome.Hello
        @explinationRegion.show new CP.Views.Welcome.Explination
        @disclaimerRegion.show new CP.Views.Welcome.Disclaimer
