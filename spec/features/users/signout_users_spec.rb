require 'rails_helper'

RSpec.feature 'User Signout' do
  let(:user1) { User.create(email: 'user1@example.com', password: 'password') }

  before do
    login_as(user1)
  end

  # You can logged in user directly using Warden helper method
  # Or you can write full steps like below.
  # But, this specs goal is not to test sign in functionality so we use `login_as` method
  # before do
  #   visit '/'
  #   click_link 'Sign in'
  #   fill_in 'Email', with: user1.email
  #   fill_in 'Password', with: user1.password
  #   click_button 'Log in'
  # end

  scenario 'Able to sign out successfully' do
    visit '/'

    click_link 'Sign out'

    expect(page).to have_content('Signed out successfully.')
  end
end