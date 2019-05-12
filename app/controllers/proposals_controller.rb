# frozen_string_literal: true

class ProposalsController < ApplicationController
  include ApplicationHelper

  def new
    @user = current_user
    @proposal = Proposal.new
  end

  def create

    proposal = Proposal.create(proposal_params)

    if proposal.save
      redirect_to user_proposal_path(current_user, proposal)
    else
      flash[:alert] = 'There was a problem creating your proposal.'
      redirect_to new_user_proposal_path
    end
  end

  def index
    @proposals = Proposal.active.sort_by{|proposal| proposal.active_votes_count}.reverse
  end

  def show
    @proposal = Proposal.find(params[:id])
    byebug
  end

  private

  def proposal_params
    params.require(:proposal).permit(:title, :description, :funding_goal, :expiration, :user_id)
  end
end
