# frozen_string_literal: true

# Address Model
class Address < ApplicationRecord
  belongs_to :merchant
end
