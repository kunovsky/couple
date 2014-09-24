CP.module "Helpers", (Helpers, App, Backbone, Marionette, $, _) ->
  class @Validations
    validations: [{name: "Number", msg: "Must be a 10 digit phone number", maskSettings: [{mask: "(999) 999-9999"}], expression: "^\\(\\d{3}\\) ?\\d{3}( |-)?\\d{4}|^\\d{3}( |-)?\\d{3}( |-)?\\d{4}"}]

    validateValue: (value) ->
    #   validationSettings = @get('properties').validations
    #   return undefined unless validationSettings?
    #   return @_getValidationMsg(validationSettings) if !(new RegExp(validationSettings.expression).test(value)) and value isnt ''
    #   return undefined

    # getValidationMask: ->
    #   validationSettings = @get('properties').validations
    #   return @_matchValidation(validationSettings)?.maskSettings if validationSettings?.expression?

    # _matchValidation: (validationSettings) ->
    #   _.find @validations, (v) -> new RegExp(v.expression).source is new RegExp(validationSettings?.expression).source


    # _getValidationMsg: (validationSettings) ->
    #   matched = @_matchValidation(validationSettings)
      
    #   return validationSettings.message if validationSettings.message? and validationSettings.message isnt ''
    #   return matched.msg if matched?
    #   return "Valid value required."


      #find the expression by name
      #evaluate the expression
      #return the message if the expression fails
      #return nothing
