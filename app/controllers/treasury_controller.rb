class TreasuryController < ApplicationController
	def donate
  end

	def process_donation
		Treasury.funds += params[:donation_amount].to_i
		flash[:alert] = "Thank you for your donation of #{params[:donation_amount]}"
		redirect_to '/donate'
	end

	def process_memberships
		Users.members.each do |member|
			Treasury.funds += member.membership_dues
		end
	end
	
	def distribute_funds
		while self.funds >= 0
			proposal = Proposal.max_votes
			remaining_funding = proposal.funding_goal - proposal.funding
			if self.funds >= remaining_funding
				proposal.funding += remaining_funding
				self.funds -= remaining_funding
				proposal.save
				self.save
				proposal.funded = true
			else
				proposal.funding += self.funds
				self.funds -= remaining.funding
				proposal.save
				self.save
			end
		end
	end


end
