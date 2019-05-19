# frozen_string_literal: true

class Membership < ApplicationRecord
  scope :active, -> { where(active: true) }
  belongs_to :user
  validates :dues, numericality: { greater_than: 10, less_than_or_equal_to: 150}
end
