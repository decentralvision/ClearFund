# ClearFund
ClearFund is the world's first decentralized charity. Contributions to the fund are distributed democratically based on members votes.

Using rails "5.2.3"

Use ruby "2.4.1" 

Use "whenever --update-crontab" to allow automated membership processing

run rake db:migrate to initialize the database

run rake rspec to run tests

* System dependencies

* Configuration

* Database creation

* Database initialization

  git config --global user.email "36858744+decentralvision@users.noreply.github.com"
  git config --global user.name "Tom K."

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

work on separation of concerns

fields with errors in all forms

add users/proposals/index page

add validations to forms (validates ;name, :presence)

specifiy strong params (figure out what to do about voting)

add comments through votes

google oauth 

basic validations



BUGS

first vote fails but gives no error -failing to recreate
