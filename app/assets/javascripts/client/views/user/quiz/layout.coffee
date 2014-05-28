CP.module "Views.Quiz", (Quiz, App, Backbone, Marionette, $, _) ->

  class @Layout extends Marionette.Layout
    template: CPT["user/quiz/layout"]

    regions:
      firstSectionRegion: "#first-section-region"
      secondSectionRegion: "#second-section-region"
      thirdSectionRegion: "#third-section-region"

    onRender: ->
      @firstSectionRegion.show new CP.Views.Quiz.FirstSection
      @secondSectionRegion.show new CP.Views.Quiz.SecondSection
      @thirdSectionRegion.show new CP.Views.Quiz.ThirdSection