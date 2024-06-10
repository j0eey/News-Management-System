$(document).ready(function() {
    // Fetch user permissions
    $.ajax({
        url: '/user-permissions', // Replace with the appropriate route to fetch user permissions
        method: 'GET',
        success: function(response) {
            var userPermissions = response.permissions;

            // Enable buttons based on user permissions
            $('[data-permission]').each(function() {
                var permission = $(this).data('permission');
                if (userPermissions.includes(permission)) {
                    $(this).removeClass('disabled-link');
                } else {
                    $(this).addClass('disabled-link');
                }
            });
        },
        error: function(xhr, status, error) {
            console.error('An error occurred while fetching permissions:', error);
        }
    });
});