$(document).on('turbolinks:load', function() {
  // If the field isn't on the page or cloudinary_fileupload is not configured
  // Just move on.
  if( $("input.cloudinary-fileupload[type=file]").length < 1 || $.fn.cloudinary_fileupload === undefined) {
    return;
  }

  // Initialize the cloudinary fields.
  $("input.cloudinary-fileupload[type=file]").cloudinary_fileupload({});

  // Add a listener that'll add a `data-upload-state` attribute when a user is uploading
  // a file, then clears it when the upload is completed.
  $("input.cloudinary-fileupload[type=file]")
    .on('fileuploadsend', function(e, data){
      $(this).attr('data-upload-state', 'running');
    })
    .on('cloudinaryalways', function(data){
      $(this).attr('data-upload-state', '');

      // If the form is disabled but submitting, resubmit it.
      if( $(this).parents('form').data('submitting') ){
        $(this).parents('form').submit();
      }
    });

  $("input.cloudinary-fileupload[type=file]").parents('form').on('submit', function(e){
    // If we're not uploading, let the form submit as normal.
    if( $(this).find('[data-upload-state="running"]').length == 0 ){
      return;
    }

    // Otherwise hold the form in the submitting state
    $(this).data('submitting', true);

    // Stop the form submitting.
    e.preventDefault();
  });
});
