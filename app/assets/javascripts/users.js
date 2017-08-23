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

    var pageField = $('#search_form [name=page]')
    $('[name=query]').on('keyup', _.debounce(function (e) {
        pageField.val(0)
        Rails.fire($("#search_form")[0], 'submit')
    }, 500))
    $(window).on('scroll', _.debounce(function () {
        var currentPage = parseInt(pageField.val()) || 1
        if(currentPage <= window.totalPages + 1) {
            pageField.val(currentPage + 1)
            Rails.fire($("#search_form")[0], 'submit')
        }
    }, 500))
});