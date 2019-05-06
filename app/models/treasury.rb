class Treasury < ApplicationRecord

	def self.funds
		self.find_or_create.funds
	end

	def self.funds=(funds)
		treasury = self.find_or_create
		treasury.funds = treasury.funds + funds
		treasury.save
	end

	def self.find_or_create 
		if self.all.empty?
			@@treasury = self.create(funds:0)
		else	
			@@treasury = Treasury.first
		end
	end


	def self.process_memberships
		treasury = Treasury.find_or_create
		User.members.each do |member|
			treasury.funds += member.membership_dues
			treasury.save
		end
		treasury.distribute_funds
	end
	
	def distribute_funds
		if Proposal.active.size != 0
			while self.funds > 0 
				proposal = Proposal.max_votes
				remaining_funding = proposal.funding_goal - proposal.funding
				if self.funds >= remaining_funding
					proposal.funding += remaining_funding
					proposal.active = false
					proposal.save
					self.funds -= remaining_funding
					self.save
				else
					proposal.funding += self.funds
					proposal.save
					self.funds = 0
					self.save
				end
			end
		end
	end
end
