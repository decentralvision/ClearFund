# frozen_string_literal: true

class ProposalsController < ApplicationController
  include ApplicationHelper

  def new
    @user = current_user
    @proposal = Proposal.new
  end

  def create
    proposal = current_user.proposals.new
    if proposal.save
      redirect_to user_proposal_path(proposal, current_user)
    else
      flash[:alert] = 'There was a problem creating your proposal.'
      redirect_to new_user_proposal_path
    end
  end

  def index
    # sort by votes
    @proposals = Proposal.active
  end

  def show
    @proposal = Proposal.find(params[:id])
  end

  private

  def proposal_params
    params.require(:proposal).permit(:title, :description, :funding_goal, :expiration, :user_id)
  end
end
