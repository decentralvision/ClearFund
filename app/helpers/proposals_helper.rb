module ProposalsHelper

	def active_votes_count
		self.votes.active.count
	end

	def active_vote?(user)
		user.active_vote_proposal_id == self.id
	end

	
end
