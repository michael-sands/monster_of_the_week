class AddAttachmentTheFileToDownloadableFiles < ActiveRecord::Migration
  def self.up
    add_attached_file :downloadable_files, :the_file
  end

  def self.down
    drop_attached_file :downloadable_files, :the_file
  end
end
