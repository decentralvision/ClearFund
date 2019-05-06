class Treasury < ApplicationRecord

	def self.funds
		self.find_or_create.funds
	end

	def self.funds=(funds)
		treasury = self.find_or_create
		treasury.funds = treasury.funds + funds
		treasury.save
	end

	def self.find_or_create 
		if self.all.empty?
			@@treasury = self.create(funds:0)
		else	
			@@treasury = Treasury.first
		end
	end

end
