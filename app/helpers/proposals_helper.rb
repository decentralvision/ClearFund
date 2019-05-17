# frozen_string_literal: true

module ProposalsHelper
  def active_votes_count
    active_votes.count
  end

  def active_votes
    votes.active
  end

  def active_vote?(user)
    user.active_vote_proposal_id == id
  end
  
  # remove this method in first release
  def active_vote(user)
    user.active_vote
  end
end
