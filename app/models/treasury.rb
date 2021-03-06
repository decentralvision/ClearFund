# frozen_string_literal: true

class Treasury < ApplicationRecord
  def self.funds
    find_or_create.funds
  end

  def self.funds=(funds)
    treasury = find_or_create
    treasury.funds += funds
    treasury.save
  end

  def self.find_or_create
    @@treasury = if all.empty?
                   create(funds: 0)
                 else
                   Treasury.first
                 end
  end

  def self.process_donation(donation)
    treasury = find_or_create
    treasury.funds += donation.to_f
    treasury.save
    treasury.distribute_funds
  end
  
  def self.process_memberships
    treasury = Treasury.find_or_create
    User.members.each do |member|  
      fractional_dues = member.membership_dues / 43800
      treasury.funds += fractional_dues
      treasury.save
    end
    treasury.distribute_funds
  end

  def distribute_funds  
    while funds > 0 && Proposal.max_vote_count != 0 && !Proposal.active.empty?
      proposal = Proposal.max_votes.first
      remaining_funding = proposal.funding_goal - proposal.funding
      if funds >= remaining_funding
        proposal.funding += remaining_funding
        proposal.active = false
        proposal.save
        self.funds -= remaining_funding
        save
      else
        proposal.funding += funds
        proposal.save
        self.funds = 0
        save
      end
    end
  end
end
