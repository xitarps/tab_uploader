class GeneratePurchaseService

  def self.call(args)
    perform(**args)
  end

  private

  def self.perform(args)
    purchase = Purchase.create!(merchant: args[:merchant], purchaser: args[:purchaser])

    purchase_item = PurchaseItem.create(item: args[:item],
                                        value: args[:item][:last_value],
                                        quantity: args[:item][:last_quantity_sold],
                                        purchase: purchase)
  end
end
