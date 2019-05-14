# frozen_string_literal: true

module UsersHelper
  def active_membership?
    membership.try(:id) && membership.try(:active) ? true : false
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

  # def clear_active_votes
  #   votes = self.votes.select{|vote| vote.active}
  #   votes.each{|vote| vote.active = false && vote.save}
  # end

end
