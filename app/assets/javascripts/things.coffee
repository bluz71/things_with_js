class Thing
  constructor: ->
    @hideNameError()
    @hideCancelButton()
    @setEventHandlers()
    @errorSet = false

  # Hide the name error alert area for the "New Thing" form. Note, the "New
  # Thing" form will be dynamically loaded by Ajax hence the hiding needs
  # to be done via an "ajax:success" callback triggered by button click that
  # loads the form.
  #
  # "page:change" is needed for turbolinks page navigation and loading.
  hideNameError: ->
    $(document).on "page:change", ->
      $("[data-behavior~=thing-new").on "ajax:success", ->
        $("[data-behavior~=thing-name-error]").hide()

  # The cancel button exists on the index.html page, hence it can be hidden
  # immediately unlike the name error above.
  #
  # "page:change" is needed for turbolinks page navigation and loading.
  hideCancelButton: ->
    $(document).on "page:change", ->
      $("[data-behavior~=thing-new-cancel]").hide()

  setEventHandlers: ->
    $(document).on "blur", "#thing_name", @thingNameBlur
    $(document).on "focus", "#thing_name", @thingNameFocus
    $(document).on "click", "[data-behavior~=thing-new-cancel]", @newThingCancel
    $(document).on "click", "[data-behavior~=thing-name-style]", @thingNameStyle

  thingNameBlur: =>
    thingName = $("#thing_name").val()
    if !@errorSet && thingName.length < 4
      @errorSet = true
      $("[data-behavior~=thing-name-error]").text("Name is too short (miminum is 4 characters)")
      $("[data-behavior~=thing-name-error]").show()

  thingNameFocus: =>
    if @errorSet
      @errorSet = false
      $("[data-behavior~=thing-name-error]").hide()

  newThingCancel: ->
    $("[data-behavior~=thing-new-cancel]").hide()
    $("[data-behavior~=thing-new]").show();
    $("[data-behavior~=thing-form-location]").text("")

  thingNameStyle: ->
    id = $(this).val()
    tr = $("[data-behavior~=thing-table-row-#{id}]")
    tr.find("[data-behavior~=thing-name-cell]").toggleClass("thing-name-style")

# Note, jQuery -> is the same as $ -> which is the same as $(document).ready ->
# All those syntaxes wait for the DOM to fully load.
jQuery ->
  new Thing()
