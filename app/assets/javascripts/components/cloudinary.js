$(document).on('turbolinks:load', function() {
  // If the field isn't on the page, cloudinary_fileupload is not configured or
  // Rails UJS is missing, don't add the listeners. 
  if( $('.cloudinary-fileupload').length === 0 
    || $.fn.cloudinary_fileupload === undefined 
    || Rails === undefined
  ) {
    return;
  }

  // Initialize the Cloudinary fields.
  $('.cloudinary-fileupload').cloudinary_fileupload();

  // Add a listener that'll add a `data-upload-state` attribute when a user is uploading
  // a file, then clears it when the upload is completed.
  $('.cloudinary-fileupload')
    .on('fileuploadsend', function(e, data){
      $(this).attr('data-upload-state', 'uploading');
    })
    .on('cloudinaryalways', function(data){
      $(this).attr('data-upload-state', null);

      // If the form is disabled but has been submitted, resubmit it.
      if( $(this).parents('form').find(Rails.formEnableSelector).length >= 1 ){
        $(this).parents('form').submit();
      }
    });

  // Add a listener to the form that'll delay the submission until the upload is complete.
  $(".cloudinary-fileupload").parents('form')
    .on('submit', function(e){
      // If we're not uploading, let the form submit as normal.
      if( $(this).find('.cloudinary-fileupload[data-upload-state="uploading"]').length == 0 ){
        return;
      }

      // Stop the form submitting (UJS will disable the submit button though!)
      e.preventDefault();
    });
});
