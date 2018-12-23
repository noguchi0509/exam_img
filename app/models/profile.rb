class Profile < ApplicationRecord
   mount_uploader :profilepic, ProfilepicUploader
   belongs_to :user
end
