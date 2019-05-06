class VotesController < ApplicationController
	

	def new

	end
	
	def create
		if current_vote = User.find(params[:user_id]).active_vote 
			current_vote.active = false
			current_vote.save
		end
		vote = Vote.find_or_create_by(user_id: params[:user_id], proposal_id: params[:proposal_id])
		vote.active = (vote.active ? !vote.active : true) 
		vote.save
  end

  def update
  end

  def delete
	end

	private
	def vote_params
		params.permit!
	end
end
