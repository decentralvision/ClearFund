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
  
  def proposals_dropdown_menu
    @links = [{:name => "Active", :url => "/proposals"}, {:name => "Expired", :url => '/expired'}, {:name => "Funded", :url => '/funded'}]

    if current_user
      @links << {:name => "Create Proposal", :url => new_user_proposal_path(current_user)}
      @links << {:name => "My Proposals", :url => user_proposals_path(current_user)}
    end
    render partial: '/proposals/dropdown_menu', locals: {links: @links}
  end
  # remove this method in first release
  def active_vote(user)
    user.active_vote
  end
end
