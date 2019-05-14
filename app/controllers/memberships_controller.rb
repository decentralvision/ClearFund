# frozen_string_literal: true
# extract some logic here 
class MembershipsController < ApplicationController
  include SessionsHelper
  before_action :authenticate_user, :except => [:new]

  def new
    if logged_in?
      if current_user.membership
        redirect_to edit_user_membership_path(current_user.membership, current_user)
      else
        @membership = Membership.new(user_id: current_user.id)
        @user = current_user
      end
    end
  end

  def destroy
    membership = current_user.membership 
    membership.active = false
    membership.save
    redirect_to edit_user_membership_path
  end

  def create
    if !current_user.membership
      membership = current_user.build_membership(membership_params)
      if membership.save
        redirect_to edit_user_membership_path(current_user, membership)
        return
      end
    else
      current_user.membership.update(active: false)
    end
    flash[:alert] = 'You already have a membership.'
    redirect_to edit_user_membership_path(current_user, current_user.membership)
  end

  def edit
    @user = current_user
    @membership = current_user.membership
  end

  def update
    membership = current_user.membership
    if membership.update(membership_params.merge(active: true))
      flash[:alert] = 'Membership successfully updated.'
      redirect_to edit_user_membership_path(current_user, membership)
    else
      flash[:alert] = 'There was a problem updating your membership.'
      redirect_to edit_membership_path(membership)
    end
  end

  private

  def membership_params
    params.require(:membership).permit(:dues, :user_id)
  end
end
