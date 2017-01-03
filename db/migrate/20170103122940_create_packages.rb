class CreatePackages < ActiveRecord::Migration
  def change
    create_table :packages do |t|
      t.string :title
      t.text :description
      t.float :price
      t.string :validity

      t.timestamps null: false
    end
  end
end
