class AddFieldsToMessage < ActiveRecord::Migration[5.0]
  def change
    add_column :messages, :lat, :float, null: false
    add_column :messages, :lng, :float, null: false

    add_column :messages, :text, :string, null: false
    add_column :messages, :author, :string, null: false
  end
end
