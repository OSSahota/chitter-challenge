require_relative 'web_helper'

feature 'Creating user account' do
  scenario 'User signs up for the first time' do
    # sign_up
    visit '/'
    click_on 'Sign up'
    fill_in :email, with: 'veryfirstusertosignup@makers.com'
    fill_in :password, with: 'password'
    fill_in :name, with: 'very first user'
    fill_in :username, with: 'uservf'
    click_on 'Sign up'
    expect(current_path).to eq '/profile'
    expect(page).to have_content 'Welcome very first user'
  end

before  {
  sign_up
}
  scenario 'User fails to sign up' do
    visit '/'
    click_on 'Sign up'
    fill_in :email, with: 'firstuser@makers.com'
    fill_in :password, with: 'password'
    fill_in :name, with: 'first user'
    fill_in :username, with: 'user1'
    click_on 'Sign up'
    expect(current_path).to eq '/unsuccessful'
    expect(page).to have_content 'You failed to sign up'
  end

end
