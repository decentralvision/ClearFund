module UsersHelper
	def active_membership?
		!!self.membership
	end

end
