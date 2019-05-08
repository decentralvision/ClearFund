# frozen_string_literal: true

module ProposalsHelper
  def active_votes_count
    votes.active.count
  end

  def active_vote?(user)
    user.active_vote_proposal_id == id
  end
end
