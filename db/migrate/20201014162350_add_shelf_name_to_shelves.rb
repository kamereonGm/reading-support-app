class AddShelfNameToShelves < ActiveRecord::Migration[5.2]
  def change
    add_column :shelves, :shelf_name, :string
    add_column :shelves, :shelf_image, :string
    add_column :shelves, :shelf_author, :string
  end
end
