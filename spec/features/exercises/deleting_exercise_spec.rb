require "rails_helper"

RSpec.feature "Deleting Exercise" do
  let(:user1) { User.create(email: 'user1@example.com', password: 'password') }

  before do
    @owner_exercise = user1.exercises.create!(duration_in_min: 48,
                                                workout: "My body building activity",
                                                workout_date: Date.today)

    login_as(user1)
  end

  scenario do
    visit "/"

    click_link "My Lounge"

    path = "/users/#{user1.id}/exercises/#{@owner_exercise.id}"
    link = "//a[contains(@href,\'#{path}\') and .//text()='Destroy']"

    find(:xpath, link).click

    expect(page).to have_content("Exercise has been deleted")
  end

end