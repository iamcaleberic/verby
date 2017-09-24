class AddAttachmentAvatarToWriters < ActiveRecord::Migration
  def self.up
    change_table :writers do |t|
      t.attachment :avatar
    end
  end

  def self.down
    remove_attachment :writers, :avatar
  end
end
