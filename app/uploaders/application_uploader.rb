class ApplicationUploader < CarrierWave::Uploader::Base
  include Cloudinary::CarrierWave
  after :store, :update_remote_tags!

  # Tag our uploads so they're nicely organised remotely.
  def tags      
    [
      "env_#{Rails.env}",
      "src_#{self.class.to_s.parameterize}",
      "#{model.class.to_s.parameterize}_#{model.id}"
    ].join(',')
  end

  def direct_uploading_tags
    [tags, 'db_unsaved'].join(',')
  end

  # When we upload, update the tags (removing the db_unsaved tag)
  def update_remote_tags!
    Cloudinary::Api.update(my_public_id, tags: tags)
  end

  def cloudinary_resource
    Cloudinary::Api.resource(my_public_id)
  end
end
