module UsersHelper
	def active_membership?
		self.membership.active
	end

end
