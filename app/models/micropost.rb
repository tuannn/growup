class Micropost < ActiveRecord::Base
  belongs_to :user
  #validation
  validates :content, presence: true, length: { maximum: 140 }
  
end
