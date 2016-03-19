class ThingValidator
  constructor: ->
    $(document).on "blur", "#thing_name", @handleBlur
    $(document).on "focus", "#thing_name", @handleFocus
    @errorSet = false

  handleBlur: =>
    thingName = $("#thing_name").val()
    if !@errorSet && thingName.length < 4
      @errorSet = true
      $("[data-behavior~=thing-name-error]").text("Name is too short (miminum is 4 characters)")
      $("[data-behavior~=thing-name-error]").show()

  handleFocus: =>
    if @errorSet
      @errorSet = false
      $("[data-behavior~=thing-name-error]").hide()

$(document).on "page:change", ->
  new ThingValidator() if $(".things.index").length > 0

$(document).on "page:change", (event, data, status, xhr)->
  $("[data-behavior~=thing-new-button").on "ajax:success", ->
    $("[data-behavior~=thing-name-error]").hide()

$(document).on "ajax:error", (event, xhr, status, error) ->
  console.log status.responseText
  console.log error
