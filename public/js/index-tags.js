$(document).ready(function(){
    // Add tag button clicked
    $('#addTagButton').click(function(){
        $('#tagModalLabel').text('Add New Tag');
        $('#tagForm').attr('action', storeUrl);
        $('#tagForm').attr('method', 'POST');
        $('#title').val('');
        $('#tagId').val('');
        $('#saveButton').text('Add Tag');
    });

    // Edit tag button clicked
    $('.editTagButton').click(function(){
        var tagId = $(this).data('id');
        var tagTitle = $(this).data('title');
        $('#tagModalLabel').text('Edit Tag');
        $('#tagForm').attr('action', '/tags/' + tagId);
        $('#tagForm').attr('method', 'POST');
        $('#title').val(tagTitle);
        $('#tagId').val(tagId);
        $('#saveButton').text('Update Tag');
    });

    // Handle form submission
    $('#tagForm').on('submit', function(event){
        event.preventDefault();
        
        var form = $(this);
        var url = form.attr('action');
        var method = $('#tagId').val() ? 'PUT' : 'POST';
        
        $.ajax({
            url: url,
            method: method,
            data: form.serialize(),
            success: function(response){
                $('#tagModal').modal('hide');
                location.reload();
            },
            error: function(response){
                alert('An error occurred. Please try again.');
            }
        });
    });

    // Delete tag button clicked
    $('.deleteTagButton').click(function(){
        if (confirm('Are you sure you want to delete this tag?')) {
            $(this).closest('form').submit();
        }
    });
});
