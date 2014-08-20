class Tag < ActiveRecord::Base
  has_many :word_tag_relation_ships, foreign_key: "tag_id"
end
