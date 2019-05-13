# frozen_string_literal: true

class TreasuryController < ApplicationController
  include TreasuryHelper
  def donate; end

  def process_donation
    process_donation_helper
  end
end
