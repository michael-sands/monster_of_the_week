class FilePermissions < ActiveRecord::Migration
  def change
    create_table :file_permissions do |t|
      t.integer :downloadable_file_id
      t.integer :user_id
      t.timestamps
    end
  end
end
