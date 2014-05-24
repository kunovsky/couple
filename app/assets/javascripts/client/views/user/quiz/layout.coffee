CP.module "Views.Quiz", (Quiz, App, Backbone, Marionette, $, _) ->

  class @Layout extends Marionette.Layout
    template: CPT["user/quiz/layout"]

    regions:
      part1Region: "#part1-region"
      part2Region: "#part2-region"
      part3Region: "#part3-region"

    onRender: ->
      @part1Region.show new CP.Views.Quiz.Part1