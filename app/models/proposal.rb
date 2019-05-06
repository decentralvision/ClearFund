class Proposal < ApplicationRecord
	include ApplicationHelper
	include ProposalsHelper

	belongs_to :user
	has_many :votes
	has_many :users, through: :votes
	

	def self.max_votes
		select{|proposal| proposal.votes.count == Proposal.max_vote_count}.first
	end

	def self.max_vote_count
		active.collect{|proposal| proposal.votes.active.count}.max
	end

	def self.active
		select{|proposal| proposal.active }
	end
end
