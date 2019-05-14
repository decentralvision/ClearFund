# frozen_string_literal: true
# extract some logic here 
class MembershipsController < ApplicationController
  include SessionsHelper
  before_action :authenticate_user, :except => [:new]

  def new
    if logged_in?
      authenticate_user
      if current_user.membership
        redirect_to edit_user_membership_path(current_user, current_user.membership)
      else
        @membership, @user = Membership.new(user_id: current_user.id), current_user
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
    @user = current_user
    @membership = @user.build_membership(membership_params)
    if @membership.save
      redirect_to edit_user_membership_path(@user, @membership)
    else
      flash[:alert] = 'There was a problem creating your membership.'
      render :new
    end
  end

  def show
    redirect_to edit_user_membership_path
  end

  def index
    redirect_to edit_user_membership_path
  end

  def edit
    @user, @membership = current_user, current_user.membership
  end

  def update
    @user, @membership = current_user, current_user.membership
    if @membership.update(membership_params.merge(active: true))
      flash[:alert] = 'Membership successfully updated.'
      redirect_to edit_user_membership_path(@user, @membership)
    else
      flash[:alert] = 'There was a problem updating your membership.'
      render :edit
    end
  end

  private

  def membership_params
    params.require(:membership).permit(:dues, :user_id)
  end
end
