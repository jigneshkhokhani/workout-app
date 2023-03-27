require 'rails_helper'

RSpec.feature 'Creating Exercise' do
  let(:user1) { User.create(email: 'user1@example.com', password: 'password') }
  before { login_as(user1) }

  scenario 'with valid inputs' do
    visit '/'

    click_link 'My Lounge'
    click_link 'New Workout'

    expect(page).to have_link('Back')

    fill_in 'Duration', with: 70
    fill_in 'Workout details', with: 'Weight lifting'
    fill_in 'Activity date', with: '2023-03-27'
    click_button 'Create Exercise'

    expect(page).to have_content('Exercise has been created')

    exercise = Exercise.last
    expect(current_path).to eq(user_exercise_path(user1, exercise))
    expect(exercise.user_id).to eq(user1.id)
  end
end
