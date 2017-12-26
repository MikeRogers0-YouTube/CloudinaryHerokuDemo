class ApplicationUploader < CarrierWave::Uploader::Base
  include Cloudinary::CarrierWave

  # Tag our uploads so they're nicely organised remotely.
  def tags      
    [
      "env_#{Rails.env}",
      "src_#{self.class.to_s.parameterize}",
      "#{model.class.to_s.parameterize}_#{model.id}"
    ].join(',')
  end
end
