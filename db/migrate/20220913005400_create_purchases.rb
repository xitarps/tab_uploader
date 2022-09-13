class CreatePurchases < ActiveRecord::Migration[6.1]
  def change
    create_table :purchases, id: :uuid do |t|
      t.references :purchaser, type: :uuid, null: false, foreign_key: true
      t.references :merchant,  type: :uuid, null: false, foreign_key: true

      t.timestamps
    end
  end
end
