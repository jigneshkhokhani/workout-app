require "rails_helper"

RSpec.feature "Following Friends" do
  let!(:john) { User.create!(first_name: "John", last_name: "Doe", email: "john@example.com", password: "password") }
  let!(:sarah) { User.create!(first_name: "Sarah", last_name: "Doe", email: "sarah@example.com", password: "password") }
  let!(:peter) { User.create!(first_name: "Peter", last_name: "Corn", email: "peter@example.com", password: "password") }

  before { login_as(john) }

  scenario "if signed in" do
    visit "/"

    expect(page).to have_content(john.full_name)
    expect(page).to have_content(sarah.full_name)
    expect(page).to have_content(peter.full_name)

    href = "/friendships?friend_id=#{john.id}"
    expect(page).not_to have_link("Follow", :href => href)

    link = "a[href='/friendships?friend_id=#{peter.id}']"
    find(link).click

    href = "/friendships?friend_id=#{peter.id}"
    expect(page).not_to have_link("Follow", :href => href)
  end

end
