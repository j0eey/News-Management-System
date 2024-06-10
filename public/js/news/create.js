document.addEventListener("DOMContentLoaded", function() {
    ClassicEditor
        .create(document.querySelector('#description'))
        .then(editor => {
            const form = document.getElementById('news-form');
            form.addEventListener('submit', function(event) {
                document.querySelector('#description').value = editor.getData().trim();
                // Check if the description is empty
                if (editor.getData().trim() === '') {
                    event.preventDefault();
                    alert('The description field is required.');
                }
            });
        })
        .catch(error => {
            console.error(error);
        });
});

document.addEventListener('DOMContentLoaded', function () {
    document.querySelectorAll('.delete-image').forEach(function (button) {
        button.addEventListener('click', function () {
            var mediaId = button.getAttribute('data-media-id');
            if (mediaId) {
                if (confirm('Are you sure you want to delete this image?')) {
                    // Construct the URL for the AJAX request to delete the image
                    var deleteUrl = deleteMediaUrl + "/" + mediaId;

                    // Perform an AJAX request to delete the image
                    fetch(deleteUrl, {
                        method: 'DELETE',
                        headers: {
                            'X-CSRF-TOKEN': document.querySelector('meta[name="csrf-token"]').getAttribute('content'),
                            'Content-Type': 'application/json'
                        },
                        body: JSON.stringify({ media_id: mediaId }) 
                    }).then(function (response) {
                        if (response.ok) {
                            return response.json();
                        } else {
                            throw new Error('Failed to delete the image. Server responded with status: ' + response.status);
                        }
                    }).then(function (data) {
                        if (data.success) {
                            // Remove the image container based on the file name
                            var imageContainer = document.querySelector(`img[src$="${data.file_name}"]`).closest('.mb-2');
                            imageContainer.remove();
                        } else {
                            console.error('Error message from server:', data.message);
                            alert('Failed to delete the image.');
                        }
                    }).catch(function (error) {
                        console.error('Error:', error);
                        alert('Failed to delete the image.');
                    });
                }
            }
        });
    });
});
