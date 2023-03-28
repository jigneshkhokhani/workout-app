require 'rails_helper'

RSpec.feature "Editing Exercise" do
  let(:user1) { User.create(email: 'user1@example.com', password: 'password') }

  before do

    @owner_exercise = user1.exercises.create!(duration_in_min: 48,
                                                workout: "My body building activity",
                                                workout_date: Date.today)

    login_as(user1)
  end

  scenario "with valid data succeeds" do
    visit '/'

    click_link "My Lounge"

    path = "/users/#{user1.id}/exercises/#{@owner_exercise.id}/edit"
    link = "a[href=\'#{path}\']"
    find(link).click

    fill_in "Duration", with: 45
    click_button "Update Exercise"

    expect(page).to have_content("Exercise has been updated")
    expect(page).to have_content(45)
    expect(page).not_to have_content(48)
  end
end
