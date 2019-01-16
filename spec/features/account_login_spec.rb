feature 'Logging in' do
  before {
    sign_up
    # log_out
  }

  scenario 'User successfully logs in to account' do
    log_in
    expect(page).to have_content 'Welcome first user'
  end

  scenario 'User fails to log in to account' do
    visit '/'
    click_on 'Log in'
    fill_in :email, with: 'seconduser@makers.com'
    fill_in :password, with: 'password'
    click_on 'Log in'
    expect(page).to have_content 'You failed to log in'
  end
end
