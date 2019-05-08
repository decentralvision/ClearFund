# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

users = User.create([{ name: 'Tom', password: 'password' }, { name: 'Rose', password: 'password' }])
proposals = Proposal.create([{ title: 'Cure Cancer', description: "We're going to cure cancer, for real! It's going to be great. Sound good? Okay, cool. Here's how: Step 1 - Research all the plants in the Amazon jungle. Step 2 - Feed them all to rats. Step 3 - Profit??", funding_goal: 600, expiration: DateTime.new(2019, 6, 6), user: User.first }, { title: 'World Peace', description: "We're going to do world peace, for real! It's going to be great. Sound good? Okay, cool. Here's how: Step 1 - Get everyone to be nice. Step 2 - Have a dance party. Step 3 - Profit??", funding_goal: 600, expiration: DateTime.new(2019, 6, 3), user: User.last }, { title: 'Solve Global Warming', description: "We're going to solve Global Warming, for real! It's going to be great. Sound good? Okay, cool. Here's how: Step 1 - Delete all cars and coal power plants. Step 2 - Give everyone free Teslas. Step 3 - Profit??", funding_goal: 60_000, expiration: DateTime.new(2019, 6, 3), user: User.last }])
memberships = Membership.create([{ user_id: 1, dues: 100 }, { user_id: 2, dues: 50 }])
votes = Vote.create([{ user_id: 1, proposal_id: 1, active: true }, { user_id: 2, proposal_id: 1, active: true }])
