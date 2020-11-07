class AddFinishDateToShelves < ActiveRecord::Migration[5.2]
  def change
    add_column :shelves, :finish_date, :date
  end
end
