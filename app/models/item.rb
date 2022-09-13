# frozen_string_literal: true

# Item Model
class Item < ApplicationRecord
  has_many :purchase_items, dependent: :nullify
  has_many :purchases, through: :purchase_items, dependent: :nullify
end
