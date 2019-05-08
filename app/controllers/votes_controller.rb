# frozen_string_literal: true

class VotesController < ApplicationController
  include ApplicationHelper

  def new; end

  def create
    vote = Vote.find_or_create_by(user_id: params[:user_id], proposal_id: params[:proposal_id])
    if vote == current_user.active_vote
      vote.active = false
      vote.save
    else
      vote.active = true
      vote.save
      if current_user.active_vote
        current_user.active_vote.active = false
        current_user.active_vote.save
      end
    end
    end

  def update; end

  def delete; end

  private

  def vote_params
    params.permit!
  end
end
