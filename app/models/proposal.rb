class Proposal < ApplicationRecord
	include ApplicationHelper
	include ProposalsHelper

	belongs_to :user
	has_many :votes
	has_many :users, through: :votes
	
	def self.max_votes
		Proposal.all.active.select{|proposal| proposal.votes.active.count}.max
	end

	def self.active
		select{|proposal| proposal.active }
	end
end
