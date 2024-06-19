$(document).ready(function() {
    $('#searchForm').on('submit', function(event) {
        event.preventDefault();

        var formData = $(this).serialize();

        $.ajax({
            url: $(this).attr('action'),
            type: $(this).attr('method'),
            data: formData,
            success: function(response) {
                $('#newsTableBody').html(response.html);

            },
            error: function(xhr) {
                console.log(xhr.responseText);
                alert('Error fetching search results. Please try again.');
            }
        });
    });
});