$(document).ready(function() {
    function performSearch(page = 1) {
        var formData = $('#searchForm').serialize() + '&page=' + page;

        $.ajax({
            url: $('#searchForm').attr('action'),
            type: $('#searchForm').attr('method'),
            data: formData,
            success: function(response) {
                $('#newsTableBody').html(response.html);
                $('#pagination-links').html(response.pagination);
                attachPaginationEvents();
            },
            error: function(xhr) {
                console.log(xhr.responseText);
                alert('Error fetching search results. Please try again.');
            }
        });
    }

    $('#searchForm').on('submit', function(event) {
        event.preventDefault();
        performSearch();
    });

    function attachPaginationEvents() {
        $('#pagination-links').find('a').on('click', function(event) {
            event.preventDefault();
            var page = $(this).attr('href').split('page=')[1];
            performSearch(page);
        });
    }

    attachPaginationEvents();
});
