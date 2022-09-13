class CreateAddresses < ActiveRecord::Migration[6.1]
  def change
    create_table :addresses, id: :uuid do |t|
      t.string     :number_code
      t.string     :location
      t.references :merchant, type: :uuid, null: false, foreign_key: true

      t.timestamps
    end
  end
end
