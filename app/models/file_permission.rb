class FilePermission < ActiveRecord::Base
  belongs_to :downloadable_file
  belongs_to :user
end
