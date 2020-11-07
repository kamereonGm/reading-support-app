class RenameShelfNameColumnToShelves < ActiveRecord::Migration[5.2]
  def change
    rename_column :shelves, :shelf_name, :title
    rename_column :shelves, :shelf_author, :author
    rename_column :shelves, :shelf_image, :image_url
  end
end
