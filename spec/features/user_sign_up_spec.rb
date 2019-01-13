feature 'User signing up' do
  scenario 'User signs up first time' do
    visit '/'
    click_on 'Sign up' # to get to sign up page
    fill_in :email, with: 'firstuser@makers.com'
    fill_in :password, with: 'password'
    fill_in :name, with: 'first user'
    fill_in :username, with: 'userf'
    click_on 'Sign up' # to submit user details
    expect(current_path).to eq '/profile'
  end
end
