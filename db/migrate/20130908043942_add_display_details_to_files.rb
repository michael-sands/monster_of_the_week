class AddDisplayDetailsToFiles < ActiveRecord::Migration
  def change
    add_column :files, :display_name, :string, default: :name
    add_column :files, :access_id, :integer, default: 0
  end
end
