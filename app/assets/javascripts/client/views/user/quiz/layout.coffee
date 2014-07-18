CP.module "Views.User.Quiz", (Quiz, CP, Backbone, Marionette, $, _) ->

  class @Layout extends Marionette.Layout
    template: CPT["user/quiz/layout"]

    regions:
      firstSectionRegion: "#first-section-region"
      secondSectionRegion: "#second-section-region"
      thirdSectionRegion: "#third-section-region"

    onRender: ->
      @firstSectionRegion.show new Quiz.OverallHappiness
      @secondSectionRegion.show new Quiz.LoveMaps
      @thirdSectionRegion.show new Quiz.FondnessAdmiration