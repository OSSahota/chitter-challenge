require_relative 'web_helper'

feature 'Logging out' do
  before {
    sign_up
  }

  scenario 'A currently logged in user logs out' do
    click_on 'Log out'
    expect(page.current_path).to eq '/'
  end
end
