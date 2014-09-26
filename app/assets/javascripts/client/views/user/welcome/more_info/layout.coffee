CP.module "Views.User.Welcome.MoreInfo", (MoreInfo, CP, Backbone, Marionette, $, _) ->

  class @Layout extends Marionette.Layout
    template: CPT["user/welcome/more_info/layout"]

    regions:
      explanationRegion: '#explanation-region'
      processRegion: '#process-region'
      researchRegion: '#research-region'
      privacyRegion: '#privacy-region'


    onRender: ->
      @explanationRegion.show new MoreInfo.Explanation
      @processRegion.show new MoreInfo.Process
      @researchRegion.show new MoreInfo.Research
      # @privacyRegion.show new MoreInfo.Privacy