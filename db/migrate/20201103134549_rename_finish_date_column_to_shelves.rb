class RenameFinishDateColumnToShelves < ActiveRecord::Migration[5.2]
  def change
    rename_column :shelves, :finish_date, :finish_on
  end
end
