# frozen_string_literal: true

class User < ApplicationRecord
  include UsersHelper

  has_one :membership
  has_many :votes

  has_many :proposals
  has_many :proposals, through: :votes

  validates :name, presence: true 
  validates :password, confirmation: true
  has_secure_password

  def self.members
    select { |user| user.try(:membership).try(:active) }
  end

  def self.from_omniauth(auth)
    # Creates a new user only if it doesn't exist
    where(name: auth.info.name).first_or_initialize do |user|
      user.name = auth.info.name
      user.password = SecureRandom.hex(10)
    end
  end

  def clear_active_vote_if_exists
    if self.active_vote
      current_vote = self.active_vote
      current_vote.active = false
      current_vote.comment = nil
      current_vote.save
    end
  end
  
  def active_vote
    self.votes.active.empty? ? nil : self.votes.active.first
  end

end
