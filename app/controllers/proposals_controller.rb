class ProposalsController < ApplicationController
	include ApplicationHelper

	def new
		@proposal = Proposal.new
	end

	def create
		# proposal = current_user.buildproposals.new(proposal_params.merge(user_id: current_user.id))
		proposal = current_user.proposal.new(proposal_params)
		byebug
		if proposal.save
			redirect_to proposal_path(proposal)
		else 
			flash[:alert] = "There was a problem creating your proposal."
			redirect_to new_proposal_path
		end
	end

	def index
		@proposals = Proposal.all
	end

	def show
		@proposal = Proposal.find(params[:id])
	end

	private

	def proposal_params
		params.require(:proposal).permit(:title, :description, :funding_goal, :expiration)
	end

end
