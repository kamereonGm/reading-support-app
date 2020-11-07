class ChangeImageUrlDefaultOnShelves < ActiveRecord::Migration[5.2]
  def change
    change_column_default :shelves, :image_url, from: nil, to: "/shelf_images/default1.png"
  end
end
