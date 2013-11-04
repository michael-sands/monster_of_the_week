class AddAttachmentTheFileToDownloadableFiles < ActiveRecord::Migration
  def self.up
    change_table :downloadable_files do |t|
      t.attachment :the_file
    end
  end

  def self.down
    drop_attached_file :downloadable_files, :the_file
  end
end
