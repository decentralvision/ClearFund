module MembershipsHelper

	include ApplicationHelper

	def membership_submit_button_text
		if @user.membership
			if @user.active_membership?
				"Update Membership"
			else
				"Renew Membership"
			end
		else
			"Create Membership"
		end
	end

end
