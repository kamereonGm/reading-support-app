class AddStatusToShelf < ActiveRecord::Migration[5.2]
  def change
    add_column :shelves, :status, :boolean, default: false, null: false
  end
end
