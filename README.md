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

# 2) Creating User sign up feature spec

1) Create a folder within the `features` folder called `users`
2) In the `users` folder create a file called `signup_users_spec.rb`

### Details of the spec expectation
1) We should show the sign up success message after the sign up process.

# 3) Creating User sign in feature spec

1) In the `users` folder create a file called `signin_users_spec.rb`

### Details of the spec expectation
1) Able to see the success message of sign in.
2) Able to see the signed in user email on page after sign in.

# 4) Creating User sign out feature spec

1) In the `users` folder create a file called `signout_users_spec.rb`

### Details of the spec expectation
1) Able to see the success message of sign out.

# 5) Feature Spec : Hide link after signin

1) Make sure the user has signed up
2) Make sure the user has signed in
3) Upon successful signin, we should see only the 'Sign out' link
4) We should neither see the 'Sign in' link nor the 'Sign up' link
