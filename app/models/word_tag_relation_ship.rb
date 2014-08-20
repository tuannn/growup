class WordTagRelationShip < ActiveRecord::Base
  belongs_to :dictionary, class_name: "Dictionary"
  belongs_to :tag, class_name: "Tag"
end
