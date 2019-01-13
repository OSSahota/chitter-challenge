require_relative 'web_helper'

feature 'Creating user account' do
  scenario 'User signs up for the first time' do
    sign_up
    expect(current_path).to eq '/profile'
    expect(page).to have_content 'Welcome first user'
  end

end
