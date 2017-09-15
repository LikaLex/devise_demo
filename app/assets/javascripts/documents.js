$(document).ready(function(){
    var pageField = $('#search_form [name=page]')
    $('[name=query]').on('keyup', _.debounce(function (e) {
        pageField.val(0)
        Rails.fire($("#search_form")[0], 'submit')
    }, 500))
    $(window).on('scroll', _.debounce(function () {
        if($(window).scrollTop() < $(document).height() - $(window).height() - 100) return
        var currentPage = parseInt(pageField.val()) || 1
        if(currentPage <= window.totalPages + 1) {
            pageField.val(currentPage + 1)
            Rails.fire($("#search_form")[0], 'submit')
        }
    }, 500))
});