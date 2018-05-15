class User::AvatarUploader < ApplicationUploader
  process convert: 'jpg'

  # http://res.cloudinary.com/demo/image/upload/c_fill,f_auto,h_180,q_auto,w_180/sample.png
  version :default do    
    eager
    #process resize_to_limit: [150, 150]
    process resize_to_fill: [180, 180]
    cloudinary_transformation quality: 'auto', fetch_format: 'auto'
  end

  # http://res.cloudinary.com/demo/image/upload/c_fill,h_48,r_max,w_48/sample.ico
  version :favicon do    
    process convert: 'ico'
    process resize_to_fill: [48, 48]
    cloudinary_transformation radius: 'max'
  end

  # http://res.cloudinary.com/demo/image/upload/c_fill,h_114,w_114/sample.png
  version :apple_touch do    
    process convert: 'png'
    process resize_to_fill: [114, 114]
  end
end
