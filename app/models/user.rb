# frozen_string_literal: true

class User < ApplicationRecord
  include UsersHelper

  has_one :membership
  has_many :votes

  has_many :proposals
  has_many :proposals, through: :votes

  has_secure_password

  def self.members
    select { |user| user.try(:membership).try(:active) }
  end
end
