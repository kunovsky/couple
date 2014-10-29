CP.module "Views.User.Welcome", (Welcome, CP, Backbone, Marionette, $, _) ->

  class @Layout extends Marionette.Layout
    template: CPT["user/welcome/layout"]

    regions:
      takeRegion: "#take-region"
      moreInfoRegion: "#more-info-region"
      videoRegion: "#video-region"


    onRender: ->
      @takeRegion.show new Welcome.Take
      @moreInfoRegion.show new Welcome.MoreInfo.Layout
      @videoRegion.show new Welcome.Video