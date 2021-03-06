class Language < ActiveRecord::Base
  belongs_to :user
  has_many :dictionaries, foreign_key: "language_id", dependent: :destroy
  
  #validation
  validates :name, presence: true, length: {maximum: 25}
end
