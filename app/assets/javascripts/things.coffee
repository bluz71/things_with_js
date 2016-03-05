$(document).on "ajax:error", (event, xhr, status, error) ->
  console.log status.responseText
  console.log error
