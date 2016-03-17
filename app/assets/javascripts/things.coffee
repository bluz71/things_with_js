class ThingValidator
  ERROR_TEMPLATE = "<div class='alert alert-danger' data-behavior='thing-name-error-text'></div>"

  constructor: ->
    $(document).on "blur", "#thing_name", @handleBlur
    $(document).on "focus", "#thing_name", @handleFocus
    @errorSet = false

  handleBlur: =>
    thingName = $("#thing_name").val()
    if !@errorSet && thingName.length < 4
      @errorSet = true
      $("[data-behavior~=thing-name-error]").append(ERROR_TEMPLATE)
      $("[data-behavior~=thing-name-error-text]").text("Name is too short (miminum is 4 characters)")

  handleFocus: =>
    if @errorSet
      @errorSet = false
      $("[data-behavior~=thing-name-error-text]").remove()

$(document).on "page:change", ->
  new ThingValidator() if $(".things.index").length > 0

$(document).on "ajax:error", (event, xhr, status, error) ->
  console.log status.responseText
  console.log error
