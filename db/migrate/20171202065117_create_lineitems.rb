class CreateLineitems < ActiveRecord::Migration[5.1]
  def change
    create_table :lineitems do |t|
      t.integer :quantity, :default => 1
      t.references :product, foreign_key: true
      t.belongs_to :cart, foreign_key: true

      t.timestamps
    end
  end
end
