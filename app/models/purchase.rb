# frozen_string_literal: true

# Purchase Model
class Purchase < ApplicationRecord
  belongs_to :purchaser
  belongs_to :merchant

  has_many :purchase_items, dependent: :nullify
  has_many :items, through: :purchase_items, dependent: :nullify
end
