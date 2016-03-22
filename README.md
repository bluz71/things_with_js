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

  * Any _ajax:error_ event will be logged to the console in the
    _application.js_ file. This will help debug JavaScript errors in the JS
    view files.

  * Setup body tag with controller and action name.

  * The _New Thing_ button on the **Things** index page, when clicked, will load
    up the **Thing** form and hide the _New Thing_ button both via a Javascript
    response triggered by the remote: true attribute attached to the _New Thing_
    link.

  * A _cancel_ button will remove the **Thing** form and redisplay the
    _New Thing_ button.

  * The _Submit_ button to create a new **Thing** will trigger a JS response
    that: removes the form, shows the _New Thing_ button and appends the newly
    created **Thing** to the **Things** table via a partial.

  * The _Edit_ action upon submission does a Javascript redirection by invoking
    the _replace action on the _window.location_ property.

  * The **Thing** model has server side validation for name presence and name
    length greater than four characters. That same validation also occurs
    client-side via the JavaScript. Those validations are contained in the
    _things.coffee_ file in the assets/javascripts directory. The actual
    validation occurs via the  _on blur_ and _on focus_ events for the name
    input field.

  * The style checkbox will toggle the background and text style of the
    **Thing** name in the table contained on the index page. This is done
    client side only via JavaScript.
