class DownloadableFile < ActiveRecord::Base
  validates :name, presence: true
  validates :display_name, presence: true
  has_attached_file :the_file, styles: {thumbnail: "60x60#"}
  validates_attachment :the_file, content_type: { content_type: "application/pdf" }
  has_many :file_permissions
  
end
