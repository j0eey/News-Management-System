$(document).ready(function() {
    $('.permissions-btn').on('click', function() {
        var memberId = $(this).data('member-id');
        var memberName = $(this).data('member-name');

        $('#permissionsMemberId').val(memberId);
        $('#permissionsMemberName').text(memberName);

        // Load current permissions for the member
        $.ajax({
            url: permissionsRoute.replace(':memberId', memberId),
            method: 'GET',
            success: function(response) {
                var allPermissions = response.allPermissions;
                var memberPermissions = response.memberPermissions;
                displayPermissions(allPermissions, memberPermissions);
            },
            error: function(xhr, status, error) {
                console.error('An error occurred while fetching permissions:', error);
                alert('An error occurred while fetching permissions');
            }
        });
    });

    $('#savePermissionsBtn').on('click', function() {
        var formData = $('#permissionsForm').serialize();

        // Send the form data to the server
        $.ajax({
            url: savePermissionsRoute,
            method: 'POST',
            data: formData,
            success: function(response) {
                alert('Permissions saved successfully');
                $('#permissionsModal').modal('hide');
            },
            error: function(xhr, status, error) {
                console.error('An error occurred while saving permissions:', error);
                alert('An error occurred while saving permissions');
            }
        });
    });

    // Ensure the close button works correctly
    $(document).on('click', '.close', function() {
        $('#permissionsModal').modal('hide');
    });
});

function displayPermissions(allPermissions, memberPermissions) {
    var permissionsList = $('#permissionsList');
    permissionsList.empty(); // Clear existing permissions

    // Create a set of member permissions for quick lookup
    var memberPermissionsSet = new Set(memberPermissions.map(p => p.title));

    // Add permissions checkboxes dynamically
    allPermissions.forEach(function(permission) {
        var isChecked = memberPermissionsSet.has(permission.title);
        var checkbox = $('<div class="form-check">' +
            '<input class="form-check-input" type="checkbox" name="permissions[]" value="' + permission.title + '"' + (isChecked ? ' checked' : '') + '>' +
            '<label class="form-check-label">' + permission.title + '</label>' +
            '</div>');
        permissionsList.append(checkbox);
    });

    console.log('Permissions displayed:', allPermissions);
}