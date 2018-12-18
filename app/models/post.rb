class Post < ApplicationRecord
     validates :content,length: { in: 1..140 }
     mount_uploader :image, ImageUploader
     belongs_to :user
     has_many :favorites, dependent: :destroy
end
