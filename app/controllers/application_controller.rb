# frozen_string_literal: true

class ApplicationController < ActionController::Base
  # before_action :ensure_treasury
  protect_from_forgery with: :exception
  # def ensure_treasury
  #   if $treasury.nil?
  #     Treasury.create unless Treasury.first
  #     @@Bank = Treasury.first
  #   end
  # end
end
