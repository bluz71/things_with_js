Simple Rails Javascript Example
===============================

A simple Rails example with some Javascript action:

  * The _Count Up_ and _Count Down_ buttons on the **Thing** show page are
    defined as remote:true and when clicked will request a JS response from the
    **Things** controller. The _countup.js.erb_ and _countdown.js.erb_ views
    will be returned and evaled on the client-side.

  * The JS response for the  _Count Up_ and _Count Down_ buttons will modify
    the count span denoted by a _data-behavior_ attribute. When targetting
    an element with Javascript it is best not to use classes or IDs since those
    should be used exclusively for styling.

  * Any _ajax:error_ event will be logged to the console in the _things.coffee_
    file. This will help debug JavaScript errors in the JS view files.

  * Setup body tag with controller and action name. This will allow per-page
    scoping for always-on Javascript. To limit always-on triggered use a
    CoffeeScript segment such as this:

        $(document).on "ready page:change", ->
          return unless $(".todo.index").length > 0
          todo = new Todo($("#todo"))
          todo.render()

  * The _New Thing_ button on the **Things** index page, when clicked, will load
    up the **Thing** form and hide the _New Thing_ button both via a Javascript
    response triggered by the remote: true attribute attached to the _New Thing_
    link.

  * The _Submit_ button to create a new **Thing** will trigger a JS response
    that: removes the form, shows the _New Thing_ button and appends the newly
    created **Thing** to the **Things** table via a partial.

