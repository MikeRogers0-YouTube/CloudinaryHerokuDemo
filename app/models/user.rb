class User < ApplicationRecord
  mount_uploader :avatar, User::AvatarUploader
end
