class News < ActiveRecord::Base
  belongs_to :user
  validates :title, presence: true, length: { maximum: 100 }
  validates :body, presence: true, length: { minimum: 10 }
  validates :user_id, presence: true
  
end
