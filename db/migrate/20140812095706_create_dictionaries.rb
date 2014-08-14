class CreateDictionaries < ActiveRecord::Migration
  def change
    create_table :dictionaries do |t|
      t.string :word
      t.string :pronunciation
      t.text :example
      t.integer :language_id

      t.timestamps
    end
  end
end
