class User < ApplicationRecord
  validates :avatar, presence: true
  validates :avatar, file_size: { less_than: 2.gigabytes }
  
  mount_uploader :avatar, User::AvatarUploader
end
