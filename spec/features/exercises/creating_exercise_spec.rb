require 'rails_helper'

RSpec.feature 'Creating Exercise' do
  let(:user1) { User.create(email: 'user1@example.com', password: 'password') }
  before do
    login_as(user1)

    visit '/'

    click_link 'My Lounge'
    click_link 'New Workout'
    expect(page).to have_link('Back')
  end

  scenario 'with valid inputs' do
    fill_in 'Duration', with: 70
    fill_in 'Workout details', with: 'Weight lifting'
    fill_in 'Activity date', with: 3.days.ago
    click_button 'Create Exercise'

    expect(page).to have_content('Exercise has been created')

    exercise = Exercise.last
    expect(current_path).to eq(user_exercise_path(user1, exercise))
    expect(exercise.user_id).to eq(user1.id)
  end

  scenario 'with invalid inputs' do

    fill_in 'Duration', with: ''
    fill_in 'Workout details', with: ''
    fill_in 'Activity date', with: ''
    click_button 'Create Exercise'

    expect(page).to have_content('Exercise has not been created')
    expect(page).to have_content("Duration in min is not a number")
    expect(page).to have_content("Workout details can't be blank")
    expect(page).to have_content("Activity date can't be blank")
  end
end
