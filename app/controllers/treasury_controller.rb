# frozen_string_literal: true

class TreasuryController < ApplicationController
  include TreasuryHelper
  def donate; end

  def process_donation
    Treasury.process_donation(params[:donation_amount])
    flash[:alert] = "Thank you for your donation of #{params[:donation_amount]}"
    redirect_to '/donate'
  end
end
