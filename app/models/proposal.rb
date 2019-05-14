# frozen_string_literal: true

class Proposal < ApplicationRecord
  include SessionsHelper
  include ProposalsHelper

  belongs_to :user
  has_many :votes
  has_many :users, through: :votes

  validates :title, length: { minimum: 10 }
  validates :description, length: { minimum: 50 }
  validates :funding_goal, numericality: { only_integer: true }
  validate :expiration_cannot_be_in_the_past

  def expiration_cannot_be_in_the_past
    if expiration.present? && expiration < Date.today
      errors.add(:expiration, "can't be in the past")
    end
  end    

  def self.max_votes
    active.select { |proposal| proposal.votes.count == Proposal.max_vote_count }
  end

  def self.max_vote_count
    active.collect { |proposal| proposal.votes.active.count }.max
  end

  def self.active
    select { |proposal| proposal.active }
  end

  def self.deactivate_expired
  end
end
