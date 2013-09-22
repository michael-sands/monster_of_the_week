class AddUserToNews < ActiveRecord::Migration
  def change
    add_column :news, :user_id, :integer
    
    add_index :news, [ :user_id, :created_at ]
  end
end
