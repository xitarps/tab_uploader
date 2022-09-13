# frozen_string_literal: true

# Merchant Model
class Merchant < ApplicationRecord
  has_many :addresses, dependent: :nullify
  has_many :purchases, dependent: :nullify
end
