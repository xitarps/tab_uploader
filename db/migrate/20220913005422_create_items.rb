class CreateItems < ActiveRecord::Migration[6.1]
  def change
    create_table :items, id: :uuid do |t|
      t.string  :description
      t.decimal :last_value
      t.float :last_quantity_sold

      t.timestamps
    end
  end
end
