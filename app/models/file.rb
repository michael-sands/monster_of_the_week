class File < ActiveRecord::Base
  validates :name, presence: true
  validates :display_name, presence: true
  validates :access_id, presence: true
  
end
