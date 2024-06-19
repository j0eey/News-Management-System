$(document).ready(function() {
    function applyPermissions(userPermissions) {
        // Enable buttons based on user permissions
        $('[data-permission]').each(function() {
            var permission = $(this).data('permission');
            if (userPermissions.includes(permission)) {
                $(this).removeAttr('disabled');
            }
        });
    }

    // Fetch user permissions
    $.ajax({
        url: '/user-permissions', // Replace with the appropriate route to fetch user permissions
        method: 'GET',
        success: function(response) {
            var userPermissions = response.permissions;
            applyPermissions(userPermissions);

            // Save user permissions globally for later use
            window.userPermissions = userPermissions;
        },
        error: function(xhr, status, error) {
            console.error('An error occurred while fetching permissions:', error);
        }
    });

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
                applyPermissions(window.userPermissions); // Reapply permissions after updating the results
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
