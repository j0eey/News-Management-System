$(document).ready(function() {
    let mainImageIndex = -1;

    // Add more images functionality
    $('#add-more-images').on('click', function() {
        $('#image-upload-container').append(
            '<div class="image-upload-wrapper mb-2">' +
                '<input type="file" name="images[]" class="form-control mt-2 new-image-input" accept="image/*">' +
                '<button type="button" class="btn btn-secondary set-main-image">Set as Main</button>' +
            '</div>'
        );
        console.log('New image upload wrapper added');
    });

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
    });

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
});