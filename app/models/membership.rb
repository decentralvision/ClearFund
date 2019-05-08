# frozen_string_literal: true

class Membership < ApplicationRecord
  scope :active, -> { where(active: true) }
  belongs_to :user
end
