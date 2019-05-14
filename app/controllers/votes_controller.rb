# frozen_string_literal: true
# extract logic here
class VotesController < ApplicationController
  include SessionsHelper
  include UsersHelper
  before_action :authenticate_user

  def new; end

  def create
    @vote = Vote.find_or_create_by(user_id: params[:user_id], proposal_id: params[:proposal_id])
    @user = current_user
    # deactivate vote if it's the user's current active vote
    @user.clear_active_vote_if_exists
    if @vote != @user.active_vote
      # clear active vote add comment, activate new vote, save 
      @vote.comment = params[:comment].empty? ? nil : params[:comment]
      @vote.active = true
      @vote.save
    end
    redirect_to '/proposals'
  end

  def update; end

  def delete; end

  private

  def vote_params
    params.require(:proposal_id, :user_id)
  end
end
