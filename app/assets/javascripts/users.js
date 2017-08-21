$(document).ready(function(){
   var $currentUserRow;
   $('#users_table').on('click', 'tr', function (e) {
       if($currentUserRow) {
           $currentUserRow.removeClass('active');
       }
       $currentUserRow = $(this);
       $currentUserRow.addClass('active');
       $('#controls').html($currentUserRow.find('.user-controls').html());
       $('#controls').prepend($currentUserRow.find('.email').html())
   })
});