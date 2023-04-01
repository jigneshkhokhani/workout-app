require "rails_helper"

RSpec. feature "Listing Exercises" do
  let(:user1) { User.create(first_name: 'u1_first', last_name: 'u1_last', email: 'user1@example.com', password: 'password') }

  before do
    login_as(user1)

    @e1 = user1.exercises.create(duration_in_min: 20,
                                  workout: "My body building activity",
                                  workout_date: Date.today)

    @e2 = user1.exercises.create(duration_in_min: 55,
                                  workout: "Weight lifting",
                                   workout_date: 2.days.ago)

    @e3 = user1.exercises.create(duration_in_min: 35,
                                  workout: "On treadmill",
                                   workout_date: 8.days.ago)

  end

  scenario "shows user's workout for last 7 days" do
    visit '/'

    click_link "My Lounge"

    expect(page).to have_content(@e1.duration_in_min)
    expect(page).to have_content(@e1.workout)
    expect(page).to have_content(@e1.workout_date)

    expect(page).to have_content(@e2.duration_in_min)
    expect(page).to have_content(@e2.workout)
    expect(page).to have_content(@e2.workout_date)

    expect(page).not_to have_content(@e3.duration_in_min)
    expect(page).not_to have_content(@e3.workout)
    expect(page).not_to have_content(@e3.workout_date)
  end

  scenario 'shows no exercises if non created' do
    user1.exercises.destroy_all

    visit '/'

    click_link 'My Lounge'

    expect(page).to have_content('No Workouts Yet')
  end
end