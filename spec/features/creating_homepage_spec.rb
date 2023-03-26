require 'rails_helper'

RSpec.feature 'Home page' do
  scenario 'Should have links called `Home` and `Athletes Den`' do
    visit '/'

    expect(page).to have_link('Home')
    expect(page).to have_link('Athletes Den')
  end

  scenario 'Should have contents called `Workout Lounge!` and `Show off your workout`' do
    visit '/'

    expect(page).to have_content('Workout Lounge!')
    expect(page).to have_content('Show off your workout')
  end
end