# frozen_string_literal: true

module ApplicationHelper
    def nav_bar
        if logged_in?
			render partial: "logged_in_nav"
		else
			render partial: "logged_out_nav"
		end
    end
end
