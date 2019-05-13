# frozen_string_literal: true
# extract logic here
class VotesController < ApplicationController
  include ApplicationHelper

  def new; end

  def create
    @vote = Vote.find_or_create_by(user_id: params[:user_id], proposal_id: params[:proposal_id])
    if @vote == current_user.active_vote
      @vote.comment = nil 
      @vote.active = false
    else
      if current_user.active_vote
        current_vote = current_user.active_vote
        current_vote.active = false
        current_vote.comment = nil
        current_vote.save
      end
      @vote.comment = params[:comment].empty? ? nil : params[:comment]
      @vote.active = true
    end
    @vote.save
    redirect_to '/proposals'
  end

  def update; end

  def delete; end

  private

  def vote_params
    params.permit!
  end
end
