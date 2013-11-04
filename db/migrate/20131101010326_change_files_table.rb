class ChangeFilesTable < ActiveRecord::Migration
  def change
    rename_table "files", "downloadable_files"
  end
end
