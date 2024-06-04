$(document).ready(function () {
    var deleteMediaUrl = $('#delete-media-url').val();
    let mainImageId = $('#main-image-id').val();
    let newlyUploadedImageId = null;



    // Set main image functionality
    $('#image-upload-container').on('click', '.set-main-image', function() {
        let $this = $(this);
        let mainImageWrapper = $this.closest('.image-upload-wrapper');
        let mainImageInput = mainImageWrapper.find('input[type="file"]');
        let mainImageIndex = mainImageWrapper.index();

        console.log('Set main image clicked, mainImageIndex:', mainImageIndex);

        // Remove primary class from all set-main-image buttons
        $('.set-main-image').removeClass('btn-primary').addClass('btn-secondary');

        // Add primary class to clicked button
        $this.removeClass('btn-secondary').addClass('btn-primary');

        // Set main image index value
        $('#main-image-index').val(mainImageIndex);

        // Log the main image index value
        console.log('Main image index set:', mainImageIndex);

        if (mainImageInput.length > 0) {
            // For newly uploaded images
            mainImageInput.on('change', function() {
                let fileInput = $(this)[0];
                if (fileInput.files && fileInput.files[0]) {
                    let reader = new FileReader();
                    reader.onload = function (e) {
                        // You can use any logic here to identify the new image
                        newlyUploadedImageId = 'temp_id'; // Replace 'temp_id' with the actual ID
                        console.log('Newly uploaded image set as main, ID:', newlyUploadedImageId);
                        $('#main-image-id').val(newlyUploadedImageId); // Update the hidden input
                    };
                    reader.readAsDataURL(fileInput.files[0]);
                }
            });
        } else {
            let mediaId = $this.data('media-id');
            console.log('Existing image set as main, ID:', mediaId);
            $('#main-image-id').val(mediaId);
        }
    });

    // Initialize main image button state
    $('.set-main-image[data-media-id="' + mainImageId + '"]').addClass('btn-primary').removeClass('btn-secondary');
    console.log('Initial main image button state set');

    // Keep media tab active after page reload
    $('a[data-toggle="tab"]').on('shown.bs.tab', function (e) {
        localStorage.setItem('activeTab', $(e.target).attr('href'));
    });

    var activeTab = localStorage.getItem('activeTab');
    if (activeTab && activeTab !== '#information') {
        $('#newsTab a[href="' + activeTab + '"]').tab('show');
    } else {
        $('#newsTab a[href="#information"]').tab('show');
    }

    // Form submission log
    $('#news-edit-form').submit(function() {
        let mainImageId = $('#main-image-id').val();
        console.log('Form submitted, main image ID:', mainImageId);
    });
});


$(document).ready(function() {
    var $saveImagesButton = $('#save-images');
    var $imageUploadContainer = $('#image-upload-container');
    var newImages = [];

    $('#add-more-images').on('click', function() {
        $('<input type="file" name="images[]" class="form-control mt-2 new-image-input">').appendTo($imageUploadContainer);
    });

    $imageUploadContainer.on('change', '.new-image-input', function() {
        if ($(this).val()) {
            newImages.push($(this));
            $saveImagesButton.prop('disabled', false);
        }
    });

    $saveImagesButton.on('click', function() {
        var formData = new FormData();
        newImages.forEach(function(input) {
            formData.append('images[]', input[0].files[0]);
        });

        $.ajax({
            url: window.saveImagesUrl,  // Use the global window variable
            type: 'POST',
            data: formData,
            contentType: false,
            processData: false,
            headers: {
                'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
            },
            success: function(response) {
                // Handle success response
                location.reload();  // Reload the page to reflect the uploaded images
            },
            error: function(xhr) {
                // Handle error response
                console.error(xhr.responseText);
            },
            complete: function() {
                $saveImagesButton.prop('disabled', true);
                newImages = [];
            }
        });
    });
});
