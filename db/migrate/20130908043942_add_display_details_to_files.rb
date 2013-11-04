class AddDisplayDetailsToFiles < ActiveRecord::Migration
  def change
    add_column :files, :display_name, :string
  end
end
