# frozen_string_literal: true
# extract logic here
class VotesController < ApplicationController
  include SessionsHelper
  include UsersHelper
  before_action :authenticate_user

  def new; end

  def create
    if current_user.active_membership?
      @user = current_user
      active_vote = @user.active_vote
      @vote = Vote.find_or_create_by(user_id: params[:user_id], proposal_id: params[:proposal_id])
      @user.clear_active_vote_if_exists
      if @vote != active_vote
        @vote.comment = params[:comment] ? params[:comment] : nil
        @vote.active = true
        @vote.save
      end
    end
    redirect_to proposals_path
  end

  def update; end

  def delete; end

  private

  def vote_params
    params.require(:proposal_id, :user_id)
  end
end
