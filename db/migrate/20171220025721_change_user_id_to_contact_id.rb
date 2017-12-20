class ChangeUserIdToContactId < ActiveRecord::Migration[5.1]
  def change
    add_column :contact_groups, :contact_id, :integer
    remove_column :contact_groups, :user_id, :integer
  end
end
