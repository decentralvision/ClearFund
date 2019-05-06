module UsersHelper
	def active_membership?
		self.membership ?	self.membership.active : false
	end

end
