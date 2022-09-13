# frozen_string_literal: true

# Purchaser Model
class Purchaser < ApplicationRecord
  has_many :purchases, dependent: :nullify
end
