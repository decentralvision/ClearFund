# frozen_string_literal: true

class Vote < ApplicationRecord
  scope :active, -> { where(active: true) }
  belongs_to :user
  belongs_to :proposal

end
