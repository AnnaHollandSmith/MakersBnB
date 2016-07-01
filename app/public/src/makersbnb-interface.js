$(document).ready(function() {

  $( "#date_from" ).change(function() {
    var dateFrom = $( this ).val();
    var yyyy = Number(dateFrom.slice(0, 4));
    var mm = Number(dateFrom.slice(5, 7));
    var dd = Number(dateFrom.slice(8));
    var dateTo = String(new Date(yyyy, mm - 1, dd + 2).toISOString()).slice(0, 10);

    $( "#date_to" ).attr( "min", dateTo );
  });
});
