$(document).ready(function() {
    // Add category button clicked
    $('#addCategoryButton').click(function() {
        $('#categoryModalLabel').text('Add New Category');
        $('#categoryForm').attr('action', storeUrl);
        $('#categoryForm').attr('method', 'POST');
        $('#_method').remove();
        $('#title').val('');
        $('#description').val('');
        $('#categoryId').val('');
        $('#saveButton').text('Add Category');
    });

    // Edit category button clicked
    $('.editCategoryButton').click(function() {
        var categoryId = $(this).data('id');
        var categoryTitle = $(this).data('title');
        var categoryDescription = $(this).data('description');
        $('#categoryModalLabel').text('Edit Category');
        $('#categoryForm').attr('action', '/categories/' + categoryId);
        $('#categoryForm').attr('method', 'POST');
        
        if ($('#_method').length === 0) {
            $('<input>').attr({
                type: 'hidden',
                id: '_method',
                name: '_method',
                value: 'PUT'
            }).appendTo('#categoryForm');
        } else {
            $('#_method').val('PUT');
        }

        $('#title').val(categoryTitle);
        $('#description').val(categoryDescription);
        $('#categoryId').val(categoryId);
        $('#saveButton').text('Update Category');
    });

    // Handle form submission
    $('#categoryForm').on('submit', function(event) {
        event.preventDefault();

        var form = $(this);
        var url = form.attr('action');
        var method = $('#categoryId').val() ? 'PUT' : 'POST'; 

        $.ajax({
            url: url,
            method: 'POST', 
            data: form.serialize(),
            success: function(response) {
                if (response.error) {
                    alert(response.error);
                } else {
                    $('#categoryModal').modal('hide');
                    location.reload(); 
                }
            },
            error: function(response) {
                alert('An error occurred. Please try again.');
            }
        });
    });


    // Delete category button clicked
    $('.deleteCategoryButton').click(function() {
        if (confirm('Are you sure you want to delete this category?')) {
            $(this).closest('form').submit();
        }
    });
});
