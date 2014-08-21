class Dictionary < ActiveRecord::Base
  belongs_to :language
  has_many :word_tag_relation_ships, foreign_key: "dictionary_id"
  
  accepts_nested_attributes_for :word_tag_relation_ships
  
  #validates
  validates :word, presence:true, uniqueness: true
  
  #scope
  #scope :random, lambda { |*args| { :order=>'RAND()', :limit=>args[0] || 1 } }
  
  def self.search(search)
    if search.nil?
      search_condition = "% %"
    else
      search_condition = "%" + search + "%"
    end
    #find(:all, :conditions => ["word LIKE ? OR pronunciation LIKE ? OR example LIKE ?", search_condition, search_condition, search_condition])
    where('word LIKE ? OR pronunciation LIKE ? OR example LIKE ?', search_condition, search_condition, search_condition)
  end

end
