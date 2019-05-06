class TreasuryController < ApplicationController
	def donate
  end

	def process_donation
		Treasury.funds += params[:donation_amount].to_i
		flash[:alert] = "Thank you for your donation of #{params[:donation_amount]}"
		treasury = Treasury.find_or_create
		treasury.distribute_funds
		redirect_to '/donate'
	end



end
