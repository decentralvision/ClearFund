# ClearFund
ClearFund is the world's first decentralized charity. Contributions to the fund are distributed democratically based on members votes.

Using Ruby 5.1.3

run rake db:migrate to initialize the database

run rake rspec

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

User Flow

route '/'

welcome links
	Donate - Login - Signup - About 
	Donation Form - login form - signup form - about page static


login
form 
login with google

signup
form
login with google

homepage
	create proposal - button
	next disbursement - timer - amount
	proposals - list
		proposal - item
			description - text
			votes - counter with vote button
				clicking vote button votes for proposal if proposal not voted, takes vote from other proposals
				unvotes proposal if voted
			funded / funding goal

proposal form
	proposal name
	description
	funding goal
	expiration date

models

user 
	has_many votes
	has_many proposals 
	has_many proposals, through votes

proposal
	belongs_to user
	has_many votes
	has_many users, through votes

vote
	belongs_to user
	belongs_to proposal
	scope: active 

treasury


controllers

	users controller
		new as /signup
		create
		edit as /update
		update
		index as members

	proposals controller
		show
		new
		create
		edit
		update
		index

	votes controller
		create
		update

	sessions controller
		new as /login
		destroy as /logout


		