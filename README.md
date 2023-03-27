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

# Introductoin to exercise management
### Exercise management:
1) User to sign in
2) Upon successful sign in, user can click on a link "My Lounge" to go to an area that shows the details of her/his workouts
3) User can then click on another link (to be styled as a button)
4) User can fill out a form with the details of workout
5) Alternatively, user can click on a link to go back to the lounge
### Exercise facts:
1) Has a duration in minutes
2) Working details (essentially a description of the activity)
3) Date of the activity
4) Can only exist in the context of a user (exercise must be owned by a user)
### Exercise expectations upon creation:
1) The new exercise's user_id has to be the same as the logged in user's
2) The current page should be the exercise's show page

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
