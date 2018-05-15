class User < ApplicationRecord
  validates :avatar, presence: true
  
  mount_uploader :avatar, User::AvatarUploader
end
