class Proposal < ApplicationRecord
	include ApplicationHelper
	include ProposalsHelper

	belongs_to :user
	has_many :votes
	has_many :users, through: :votes
	
	def self.max_votes
		select{|proposal| (proposal.try(:active).votes.active.count)}.max
	end

	def self.active
		select{|proposal| proposal.active }
	end
end
