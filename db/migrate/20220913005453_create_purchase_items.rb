class CreatePurchaseItems < ActiveRecord::Migration[6.1]
  def change
    create_table :purchase_items, id: :uuid do |t|
      t.references :purchase, type: :uuid, null: false, foreign_key: true
      t.references :item,     type: :uuid, null: false, foreign_key: true
      t.decimal    :value
      t.float      :quantity

      t.timestamps
    end
  end
end
