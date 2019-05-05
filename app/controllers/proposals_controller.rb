class ProposalsController < ApplicationController
	include ApplicationHelper

	def new
		@user = current_user
		@proposal = Proposal.new
	end

	def create
		proposal = current_user.proposals.new(proposal_params)
		# proposal = current_user.proposals.build(proposal_params)

		if proposal.save
			redirect_to user_proposal_path(proposal, current_user)
		else 
			flash[:alert] = "There was a problem creating your proposal."
			redirect_to new_user_proposal_path
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
		params.require(:proposal).permit(:title, :description, :funding_goal, :expiration, :user_id)
	end

end
