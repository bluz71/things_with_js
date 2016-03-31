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
  hideNameError: ->
    $(document).on "ajax:success", "[data-behavior~=thing-new]", ->
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
    $(document).on "click", "[data-behavior~=json-thing-render]", @jsonThingRender
    $(document).on "click", "[data-behavior~=json-thing-jbuilder]", @jsonThingJbuilder
    $(document).on "click", "[data-behavior~=json-thing-collection]", @jsonThingCollection
    $(document).on "click", "[data-behavior~=json-thing-interval]", @jsonThingInterval
    $(document).on "click", "[data-behavior~=json-thing-reset]", @jsonThingReset

  thingNameBlur: (event) =>
    thingName = $("#thing_name").val()
    if !@errorSet && thingName.length < 4
      @errorSet = true
      $("[data-behavior~=thing-name-error]").text("Name is too short (miminum is 4 characters)")
      $("[data-behavior~=thing-name-error]").show()

  thingNameFocus: (event) =>
    if @errorSet
      @errorSet = false
      $("[data-behavior~=thing-name-error]").hide()

  newThingCancel: (event) ->
    $("[data-behavior~=thing-new-cancel]").hide()
    $("[data-behavior~=thing-new]").show();
    $("[data-behavior~=thing-form-location]").empty()

  thingNameStyle: (event) ->
    id = $(this).val()
    tr = $("[data-behavior~=thing-table-row-#{id}]")
    tr.find("[data-behavior~=thing-name-cell]").toggleClass("thing-name-style")

  jsonThingRender: (event) =>
    @ajaxJsonThing("/json_thing/thing/rendered", @appendJsonThing)

  jsonThingJbuilder: (event) =>
    @ajaxJsonThing("/json_thing/thing/jbuildered", @appendJsonThing)

  jsonThingCollection: (event) =>
    @ajaxJsonThing("/json_thing/thing/collection", @appendJsonThings)

  jsonThingInterval: (event) =>
    @interval = setInterval(@addThing, 1500)

  jsonThingReset: (event) =>
    $("[data-behavior~=json-thing-render-list]").empty()
    clearInterval(@interval) if @interval?

  ajaxJsonThing: (url, onSuccessFunc) =>
    $.ajax(
      url: url,
      method: "GET",
      dataType: "json",
      success: onSuccessFunc)

  appendJsonThings: (things) =>
    for thing in things
      @appendJsonThing(thing)

  addThing: =>
    thing =
      name: "addThing"
      count: Math.floor(Math.random() * 100)
    @appendJsonThing(thing)

  appendJsonThing: (thing) ->
    $("[data-behavior~=json-thing-render-list]").append(
      """<li>
           <strong>Name:</strong> <em>#{thing.name}</em>
           <strong>count:</strong> <em>#{thing.count}</em>
         </li>""")

# Note, jQuery -> is the same as $ -> which is the same as $(document).ready ->
# All those syntaxes wait for the DOM to fully load.
jQuery ->
  new Thing()
