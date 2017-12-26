class User::AvatarUploader < ApplicationUploader
  version :default do    
    eager
    #process resize_to_limit: [150, 150]
    process resize_to_fill: [180, 180]
    cloudinary_transformation quality: 'auto', fetch_format: 'auto'
  end

  version :favicon do    
    process convert: 'ico'
    process resize_to_fill: [48, 48]
    cloudinary_transformation radius: 'max'
  end

  version :apple_touch do    
    process convert: 'png'
    process resize_to_fill: [114, 114]
  end
end
