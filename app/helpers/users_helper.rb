# frozen_string_literal: true

module UsersHelper
  def active_membership?
    membership ? membership.active : false
  end

  def membership_dues
    membership.dues
  end

  def active_vote
    votes.active.empty? ? nil : votes.active.first
  end

  def vote_comment
    self.active_vote.comment
  end

  def active_vote_proposal_id
    active_vote ? active_vote.proposal_id : nil
  end
end
