# frozen_string_literal: true

class ProposalsController < ApplicationController
  include SessionsHelper
  before_action :authenticate_user, :except => [:index, :show, :funded, :expired]

  def new
    @proposal, @user = Proposal.new, current_user
    unless params[:user_id].to_i == current_user.id
      redirect_to new_user_proposal_path(current_user)
    end
  end

  def create
    @user, @proposal = current_user, Proposal.new(proposal_params)
    if @proposal.save
      redirect_to user_proposal_path(@user, @proposal)
    else
      flash[:alert] = 'There was a problem creating your proposal.'
      render :new
    end
  end

  def index
    if params[:user_id]
      @proposals = Proposal.select{|proposal| proposal.user_id == params[:user_id].to_i }
      if @proposals.length > 1
        render :index
      elsif @proposals.length > 0
        @proposal = @proposals[0]
        render :show
      else
        render :nothing_here
      end
    else
      @proposals = Proposal.active.sort_by{|proposal| proposal.active_votes_count}.reverse
    end
  end

  def funded
    @proposals = Proposal.all.select{|proposal| proposal.funding_goal == proposal.funding}
    if !@proposals.empty?
      render :index
    else
      render :nothing_here
    end
  end

  def expired
    @proposals = Proposal.select{|proposal| proposal.expiration < Date.new }
    if !@proposals.empty?
      render :index
    else
      render :nothing_here
    end
  end

  def show
    @proposal = Proposal.find(params[:id])
  end

  private

  def proposal_params
    params.require(:proposal).permit(:title, :description, :funding_goal, :expiration, :user_id)
  end
end
