class Micropost < ActiveRecord::Base
  belongs_to :user
  #validation
  validates :content, presence: true, length: { maximum: 140 }
  validates :user_id, presence: true
  
  # scopes
  default_scope -> { order('created_at DESC') }
  
end
