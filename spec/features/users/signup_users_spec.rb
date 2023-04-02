require 'rails_helper'

RSpec.feature 'User Signup' do
  scenario 'with valid credentials' do
    visit '/'

    click_link 'Sign up'

    fill_in 'First name', with: 'u_first'
    fill_in 'Last name', with: 'u_last'
    fill_in 'Email', with: 'user@example.com'
    fill_in 'Password', with: 'password'
    fill_in 'Password confirmation', with: 'password'

    click_button 'Sign up'

    expect(page).to have_content('You have signed up successfully.')
    expect(page).to have_content('u_first u_last')
    expect(page).to have_link('Sign out')

    expect(page).not_to have_link('Sign in')
    expect(page).not_to have_link('Sign up')

    # To test the chat functionality
    user = User.last
    room = user.room
    room_name = user.full_name.split.join('-')

    expect(room.name).to eq(room_name)
  end

  scenario 'with invalid credentials' do
    visit '/'

    click_link 'Sign up'

    fill_in 'First name', with: ''
    fill_in 'Last name', with: ''
    fill_in 'Email', with: 'user@example.com'
    fill_in 'Password', with: 'password'
    fill_in 'Password confirmation', with: 'password'

    click_button 'Sign up'

    expect(page).to have_content("First name can't be blank")
    expect(page).to have_content("Last name can't be blank")
    expect(page).not_to have_link('Sign out')

    expect(page).to have_link('Sign in')
    expect(page).to have_link('Sign up')
  end
end