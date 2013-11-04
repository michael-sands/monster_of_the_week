class AddDisplayDetailsToFiles < ActiveRecord::Migration
  def change
    add_column :files, :display_name, :string
    add_column :files, :access_id, :integer
  end
end
