# frozen_string_literal: true

module TreasuryHelper
    def process_donation_helper
        treasury = Treasury.find_or_create
        treasury.funds += params[:donation_amount].to_i
        treasury.save
        flash[:alert] = "Thank you for your donation of #{params[:donation_amount]}"
        treasury.distribute_funds
        redirect_to '/donate'
    end
end
