$(function(){
  $('#posts_datatable').dataTable( {
      "bProcessing": true,
      "sAjaxSource": window.location.toString(),
      "bServerSide": true,
      "bProcessing": true,
      "aaSorting": [[ 0, "desc" ]],
      "aoColumns": [
        {  bSearchable: true },
        {  "bVisible":    false, bSearchable: true, "asSorting": [ "asc", "desc" ] },
        {  "bVisible":    false, bSearchable: true, "asSorting": [ "asc", "desc" ] },
        {  "bVisible":    false, bSearchable: true, "asSorting": [ "asc", "desc" ] }
        ]
  } );
});