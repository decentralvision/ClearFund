# frozen_string_literal: true

class TreasuryController < ApplicationController
  def donate; end

  def process_donation
    treasury = Treasury.find_or_create
    treasury.funds += params[:donation_amount].to_i
    treasury.save
    flash[:alert] = "Thank you for your donation of #{params[:donation_amount]}"
    treasury.distribute_funds
    redirect_to '/donate'
  end
end
