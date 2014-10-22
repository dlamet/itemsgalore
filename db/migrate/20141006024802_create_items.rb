class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :description
      t.float :price
      t.integer :purchase_count
      t.integer :merchant_id
      t.integer :purchaser_id

      t.timestamps
    end
  end
end
