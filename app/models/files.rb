class Files < ActiveRecord::Base
  validates :name, presence: true
  validates :access_id, presence: true
end
