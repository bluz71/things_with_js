class ThingValidator
  constructor: ->
    @initHiddenNameError()
    @initHiddenCancelButton()
    $(document).on "blur", "#thing_name", @handleBlur
    $(document).on "focus", "#thing_name", @handleFocus
    $(document).on "click", "[data-behavior~=thing-new-cancel]", @handleCancel
    @errorSet = false

  initHiddenNameError: ->
    $("[data-behavior~=thing-new").on "ajax:success", ->
      $("[data-behavior~=thing-name-error]").hide()

  initHiddenCancelButton: ->
    $("[data-behavior~=thing-new-cancel]").hide()

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

  handleCancel: ->
    $("[data-behavior~=thing-new-cancel]").hide()
    $("[data-behavior~=thing-new]").show();
    $("[data-behavior~=thing-form-location]").text("")

$(document).on "page:change", ->
  new ThingValidator() if $(".things.index").length > 0
