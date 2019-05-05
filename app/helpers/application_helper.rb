module ApplicationHelper
	
	def logged_in?
		!!session[:user_id]
	end

	def current_user
		logged_in? ? User.find(session[:user_id]) : nil
	end
end