$(document).ready(function () {
    $('#searchInput').on('keyup', function () {
        var query = $(this).val();
        
        $.ajax({
            url: "/news/search",
            type: "GET",
            data: {
                query: query,
                _token: $('meta[name="csrf-token"]').attr('content')
            },
            success: function (data) {
                $('#newsTableBody').html(data.html);
            },
            error: function (xhr, status, error) {
                console.error("Error occurred during search request:", error);
            }
        });
    });
});
