class Vote < ApplicationRecord
	# scope active?
	belongs_to :user
	belongs_to :proposal
end
