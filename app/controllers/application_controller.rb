class ApplicationController < ActionController::Base
	before_action :ensure_treasury
	protect_from_forgery with: :exception
	def ensure_treasury
		Treasury.create unless Treasury.first
	end
end
