class RemoveNameColumn < ActiveRecord::Migration[5.1]
  def change
    remove_column :contacts, :name, :string
  end
end
