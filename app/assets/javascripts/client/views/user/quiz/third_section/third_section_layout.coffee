CP.module "Views.Quiz", (Quiz, App, Backbone, Marionette, $, _) ->

  class @ThirdSection extends Marionette.Layout
    template: CPT["user/quiz/third_section/third_section_layout"]

    regions:
      fondnessAdmirationRegion:     "#fondness-admiration-region"
      turningTowardsRegion:         "#turning-towards-region"
      emotionalDisengagementRegion: "#emotional-disengagement-region"

    onRender: ->
      @fondnessAdmirationRegion.show new CP.Views.Quiz.FondnessAdmiration
      @turningTowardsRegion.show new CP.Views.Quiz.TurningTowards
      @emotionalDisengagementRegion.show new CP.Views.Quiz.EmotionalDisengagement