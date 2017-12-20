class AddDateToDetail < ActiveRecord::Migration[5.1]
  def change
    add_column :details, :date, :datetime
  end
end
