class ChangeColumnName < ActiveRecord::Migration
  def change
    rename_column :word_tag_relation_ships, :dictionnary_id, :dictionary_id
  end
end
