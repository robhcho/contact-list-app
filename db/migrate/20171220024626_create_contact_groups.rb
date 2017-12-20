class CreateContactGroups < ActiveRecord::Migration[5.1]
  def change
    create_table :contact_groups do |t|

      t.timestamps
    end
  end
end
