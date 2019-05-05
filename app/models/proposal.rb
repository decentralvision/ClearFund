class Proposal < ApplicationRecord
	belongs_to :user
	has_many :votes
	has_many :users, through: :votes
end
