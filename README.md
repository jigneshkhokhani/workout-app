# Udemy course reference

Workout-app : [Ruby on Rails 5 - BDD, RSpec and Capybara](https://www.udemy.com/course/ruby-rails-5-bdd-rspec-capybara)

# How to run the project
Run below command from terminal to up all services from `docker-compose` file.

```ruby
docker-compose up
```

# How to run `rspec` automatically
Run below command from terminal to watch changes and run specs.

```ruby
bin/guard
```

# 1) Creating home page feature spec

1) Create a folder within the `spec` folder called `features`
2) In the `features` folder create a file called `creating_homepage_spec.rb`

### Details of the spec
- When a user visits the home page, we want to see four things:
    1) We should see a link called `Home`
    2) We should see a link called `Athletes Den`
    3) We should see content `Workout Lounge!`
    4) We should see content `Show off your workout`

- Call the conteroller DashboardsController
