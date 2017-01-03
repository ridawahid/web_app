class Package < ActiveRecord::Base
	belongs_to :user
	belongs_to :category
	has_attached_file :package_img, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :package_img, content_type: /\Aimage\/.*\Z/
end
