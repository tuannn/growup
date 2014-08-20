class CreateWordTagRelationShips < ActiveRecord::Migration
  def change
    create_table :word_tag_relation_ships do |t|
      t.integer :dictionnary_id
      t.integer :tag_id

      t.timestamps
    end
  end
end
