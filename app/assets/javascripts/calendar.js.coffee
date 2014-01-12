ready = ->
  $(".js_date").datetimepicker({
    showButtonPanel: true,
    constrainInput: true,
    autoSize: true,
    icons: {
      time: "fa fa-clock-o",
      date: "fa fa-calendar",
      up: "fa fa-arrow-up",
      down: "fa fa-arrow-down"
    }
  });

$(document).ready(ready)
$(document).on('page:load', ready)
