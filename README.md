# Consuming your Rails Engine API

## Setup

Just like your week 1 project, this will be a new Rails app. You can either pull this repo and pick up at The Challenge section below, or start completely from scratch. This will NOT be an API, so do not use the `-api` flag if you decide to start from scratch.

```sh
rails new rails_engine_fe -T -d postgresql
cd rails_engine_fe
bundle
bundle exec rake db:create
```

Add gem 'rspec-rails' and gem 'capybara' to your :development, :test block in your Gemfile.

```sh
bundle
rails g rspec:install
```

In `/config/puma.rb`, change the port 3000 to 5000. This should be on or around line 12.

We do this because Rails Engine is not in production or hosted somewhere other than localhost. If Rails Engine is running on port 3000, our front end will need to have a different port so they can run at the same time. Now, when we do `rails s`, our front end application will automatically use port 5000. You can also do this manually every time you start your server by passing the port number with a `-p` flag like so:
`rails s -p 5000`. You should see that your server is "listening on tcp://localhost:5000" now instead of the usual 3000.

```ruby
port        ENV.fetch("PORT") { 5000 }
```

## The Challenge

### User Story - Merchants
As a visitor, <br>
When I visit '/merchants' <br>
I should see a list of merchants by name <br>
and when I click the merchant's name <br>
I should be on page '/merchants/:id' <br>
And I should see a list of items that merchant sells.

<br>
<br>

![Wireframe for /merchants index](/docs/rails_engine_challenge_merchants.png)

<br>
<br>

![Wireframe for /merchants show](/docs/rails_engine_challenge_merchants_show.png)



## Extra Practice
If you have time or want extra practice, complete this user story for Items

### User Story - Items
As a visitor, <br>
When I visit '/items' <br>
I should see a list of items by name <br>
and when I click the item's name <br>
I should be on page '/items/:id' <br>
And I should see the name of the item, description, and unit price.

## Extension Ideas
* Create a search form on your root path to consume one of your part 2 endpoints to search for one merchant or all merchants by a name fragment

![Wireframe for /merchants show](/docs/rails_engine_challenge_search.png)

## Learning/Review Goals:
* Practice TDD
* Consuming an API
* Gain familiarity with service oriented architecture
