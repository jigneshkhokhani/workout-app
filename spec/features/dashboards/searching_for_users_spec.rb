require "rails_helper"

RSpec.feature "Searching for User" do
  let!(:john) { User.create!(first_name: "John", last_name: "Doe", email: "john@example.com", password: "password") }
  let!(:sarah) { User.create!(first_name: "Sarah", last_name: "Doe", email: "sarah@example.com", password: "password") }

  scenario "with existing name returns all those users" do
    visit '/'

    fill_in "search_name", with: "Doe"
    click_button "Search"

    expect(page).to have_content(john.full_name)
    expect(page).to have_content(sarah.full_name)
    expect(current_path).to eq("/dashboards/search")
  end

end
