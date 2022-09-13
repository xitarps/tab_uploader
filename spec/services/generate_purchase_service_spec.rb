# frozen_string_literal: true

require 'rails_helper'

RSpec.describe GeneratePurchaseService do
  describe '.call' do
    context 'when has right parameters' do
      let(:purchaser) { Purchaser.new }
      let(:merchant) { Merchant.new }
      let(:item) { Item.new }
      it 'generates purchase successfully' do
        GeneratePurchaseService.call(purchaser: purchaser, merchant: merchant, item: item)
        expect(Purchase.count).to be_eql(1)
      end
    end

    context 'when has wrong parameters' do
      it 'doesn\'t generates purchase' do
        input_data = { purchaser: {}, merchant: {}, item: {} }
        expect { GeneratePurchaseService.call(input_data) }.to raise_error(ActiveRecord::AssociationTypeMismatch)
        expect(Purchase.count).not_to be_eql(1)
      end
    end
  end
end
