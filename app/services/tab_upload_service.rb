# frozen_string_literal: true

# Service to deal with uploaded Data from Tab files
class TabUploadService
  def initialize(file)
    encoded_file = utf8_encode(file).remove("\"")
    @rows = split_rows(encoded_file)
    @header = @rows.shift
  end

  def self.call(arg)
    new(arg).call
  end

  def call
    add_data_to_history(generate_sales_data)
  end

  private

  attr_accessor :rows, :header

  def generate_sales_data
    rows.map do |row|
      purchaser, merchant, item = generate_purchase_components(row)

      GeneratePurchaseService.call(purchaser: purchaser, merchant: merchant, item: item)

      purchase_value(item)
    end
  end

  def generate_purchase_components(row)
    purchaser, merchant = generate_purchase_and_merchant(row)

    address = row[header.index('merchant address')].split
    Address.find_or_create_by!(number_code: address.shift, location: address.join(' '),
                               merchant: merchant)

    item = generate_item(row)

    [purchaser, merchant, item]
  end

  def generate_purchase_and_merchant(row)
    [Purchaser.find_or_create_by!(name: row[header.index('purchaser name')]),
     Merchant.find_or_create_by!(name: row[header.index('merchant name')])]
  end

  def generate_item(row)
    item = Item.find_or_create_by!(description: row[header.index('item description')])
    item.update(last_value: row[header.index('item price')],
                last_quantity_sold: row[header.index('purchase count')])
    item
  end

  def add_data_to_history(amount)
    total_file = UploadSalesHistory.create(total_gross_income: amount.sum)
    total_all = UploadSalesHistory.sum(:total_gross_income)

    { uploads_values:
      { file_gross_income: total_file.total_gross_income,
        total_gross_income: total_all } }
  end

  def purchase_value(item)
    item.last_value * item.last_quantity_sold
  end

  def utf8_encode(text)
    encoded = text.force_encoding('UTF-8')
    return encoded if encoded.valid_encoding?

    text.encode('utf-8', invalid: :replace, undef: :replace, replace: '?')
  end

  def split_rows(file)
    file.split("\n").map { |row| row.split("\t") }
  end
end
