# frozen_string_literal: true

module MembershipsHelper
  include ApplicationHelper

  def membership_nav_link
    if current_user.try(:membership)
			link_to "Membership", edit_user_membership_path(current_user, current_user.membership)
    else
      if logged_in?
        link_to "Membership", new_user_membership_path(current_user)
      else
        link_to "Membership", '/memberships'
      end
		end
  end

  def membership_submit_button_text
    if @user.membership.try(:id)
      if @user.active_membership?
        'Update Membership'
      else
        'Renew Membership'
      end
    else
      'Create Membership'
    end
  end
end
