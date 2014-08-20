class AddColumnToDictionary < ActiveRecord::Migration
  def change
    add_column :dictionaries, :meaning, :string
  end
end
