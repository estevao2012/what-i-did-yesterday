$(function() {
  var dateFormat = "yy-mm-dd";

  var from = $( "#from" ).datepicker({
    defaultDate: "+1w",
    changeMonth: true,
    numberOfMonths: 3,
    dateFormat: dateFormat,
    maxDate: "-1D"
  }).on( "change", function() {
    to.datepicker( "option", "minDate", getDate( this ) );
  });

  var to = $( "#to" ).datepicker({
    defaultDate: "+1w",
    changeMonth: true,
    numberOfMonths: 3,
    dateFormat: dateFormat,
    maxDate: "+1D"
  }).on( "change", function() {
    from.datepicker( "option", "maxDate", getDate( this ) );
  });

  function getDate( element ) {
    var date;
    try { date = $.datepicker.parseDate( dateFormat, element.value ); }
    catch( error ) { date = null; }
    return date;
  }
});
