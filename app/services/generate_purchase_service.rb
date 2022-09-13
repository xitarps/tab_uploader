# frozen_string_literal: true

# Service to generate Purchase and Purchase Item
class GeneratePurchaseService
  def self.call(args)
    perform(**args)
  end

  def self.perform(args)
    purchase = Purchase.create!(merchant: args[:merchant],
                                purchaser: args[:purchaser])

    PurchaseItem.create(item: args[:item],
                        value: args[:item][:last_value],
                        quantity: args[:item][:last_quantity_sold],
                        purchase: purchase)
  end
end
