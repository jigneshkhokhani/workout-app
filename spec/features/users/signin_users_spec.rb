require 'rails_helper'

RSpec.feature 'User Signin' do
  let(:user1) { User.create(email: 'user1@example.com', password: 'password') }

  scenario 'with valid credentials' do
    visit '/'

    click_link 'Sign in'

    fill_in 'Email', with: user1.email
    fill_in 'Password', with: user1.password

    click_button 'Log in'

    expect(page).to have_content('Signed in successfully.')
    expect(page).to have_content("Signed in as #{user1.email}")
    expect(page).to have_link('Sign out')

    expect(page).not_to have_link('Sign in')
    expect(page).not_to have_link('Sign up')
  end
end