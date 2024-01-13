Minesweeper Rails 7 App

ruby "3.0.0", "rails", "~> 7.1.2"

This is an application for generating Minesweeper boards. 

The user inserts the board dimensions and the amount of mines in it.

Features:
- Slug: Each board has a unique UI-friendly slug derived from its name.
- Search Box: Users can search for boards by name or email.
- Sort Component: Users can sort boards by size, name, or difficulty.
- BoardGeneratorService: A service that generates a 2D representation of the board.

Cloning and Installation

1- Clone the repository: git clone git@github.com:BRMonte/one-step-challenge.git
2- Navigate to the project directory: cd minesweeper
3- Install gems:   bundle install
4- Create the database:   rails db:create
5- Seed the database:  rails db:seed
6- Run the server: rails s

Gems

1- pg: PostgreSQL adapter for ActiveRecord.
2- rspec-rails: Testing framework.
3- factory_bot_rails: Object generation for tests.
4- 'sassc-rails'
5- 'bootstrap', '~> 5.3.2'
6- 'kaminari'
