jQuery(document).ready ->
  $(".datepicker").datepicker({
    dateFormat: 'dd-mm-yy',
    showButtonPanel: true,
    constrainInput: true,
    autoSize: true
  });
