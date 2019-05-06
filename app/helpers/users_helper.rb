module UsersHelper
	def active_membership?
		self.membership ?	self.membership.active : false
	end
	def membership_dues
		self.membership.dues
	end
	def active_vote
		self.votes.active.empty? ? nil : self.votes.active.first
	end
	def active_vote_proposal_id
		self.active_vote ? self.active_vote.proposal_id : nil
	end

end
