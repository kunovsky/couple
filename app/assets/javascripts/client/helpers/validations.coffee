CP.module "Helpers", (Helpers, App, Backbone, Marionette, $, _) ->
  class @Validations
    validations: [
      {name: "text", expression: "^\\(\\d{3}\\) ?\\d{3}( |-)?\\d{4}|^\\d{3}( |-)?\\d{3}( |-)?\\d{4}"},
      {name: "email", expression: "[a-zA-Z0-9._%-]+@[a-zA-Z0-9-]+\\.[a-zA-Z]{2,4}"}
    ]

    invalidValue: (data) ->
      return true unless matched = @matchValidation(data)
      return true if !(new RegExp(matched.expression).test(@value(data)))

    matchValidation: (data) -> _.find @validations, (v) -> v.name is _.keys(data)[0]

    value: (data) -> _.values(data)[0]