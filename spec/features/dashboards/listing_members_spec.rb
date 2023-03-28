require 'rails_helper'

RSpec.feature 'Listing Members' do
  let!(:user1) { User.create(first_name: 'u1_first', last_name: 'u1_last', email: 'user1@example.com', password: 'password') }
  let!(:user2) { User.create(first_name: 'u2_first', last_name: 'u2_last', email: 'user2@example.com', password: 'password') }

  scenario 'show a list of registered members' do
    visit '/'

    expect(page).to have_content('List of Members')
    expect(page).to have_content(user1.full_name)
    expect(page).to have_content(user2.full_name)
  end
end