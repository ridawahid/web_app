class AddCategoryIdToPackages < ActiveRecord::Migration
  def change
    add_column :packages, :category_id, :integer
  end
end
