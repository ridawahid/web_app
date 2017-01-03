class AddAttachmentPackageImgToPackages < ActiveRecord::Migration
  def self.up
    change_table :packages do |t|
      t.attachment :package_img
    end
  end

  def self.down
    remove_attachment :packages, :package_img
  end
end
