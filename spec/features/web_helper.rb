def sign_up
  visit '/'
  click_on 'Sign up'
  fill_in :email, with: 'firstuser@makers.com'
  fill_in :password, with: 'password'
  fill_in :name, with: 'first user'
  fill_in :username, with: 'user1'
  click_on 'Sign up'
end

def first_peep
  click_on 'New Peep'
  fill_in 'peep', with: 'first peep'
  click_on 'Post Peep'
end

def second_peep
    click_on 'New Peep'
    fill_in 'peep', with: 'second peep'
    click_on 'Post Peep'
end

def log_in
  visit '/'
  click_on 'Log in'
  fill_in :email, with: 'firstuser@makers.com'
  fill_in :password, with: 'password'
  click_on 'Log in'
end
