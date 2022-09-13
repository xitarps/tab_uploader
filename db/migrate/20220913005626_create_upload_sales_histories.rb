class CreateUploadSalesHistories < ActiveRecord::Migration[6.1]
  def change
    create_table :upload_sales_histories, id: :uuid do |t|
      t.decimal :total_gross_income

      t.timestamps
    end
  end
end
