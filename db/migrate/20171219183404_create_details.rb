class CreateDetails < ActiveRecord::Migration[5.1]
  def change
    create_table :details do |t|
      t.string :shop_name
      t.string :cust_name
      t.string :phone
      t.string :address
      t.string :status

      t.timestamps
    end
  end
end
