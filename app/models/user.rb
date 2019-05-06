class User < ApplicationRecord
	include UsersHelper
	
	has_one :membership
	has_many :votes
	
	has_many :proposals
	has_many :proposals, through: :votes

	has_secure_password

end
