class Files < ActiveRecord::Base
  validates :name, presence: true
end
