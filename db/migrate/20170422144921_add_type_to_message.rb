class AddTypeToMessage < ActiveRecord::Migration[5.0]
  def change
    add_column :messages, :message_type, :string, null: false, default: 'comment'
  end
end
