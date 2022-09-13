# frozen_string_literal: true

# PurchaseItem Model
class PurchaseItem < ApplicationRecord
  belongs_to :purchase
  belongs_to :item
end
