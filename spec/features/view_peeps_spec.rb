require_relative 'web_helper'

feature 'Viewing Peeps' do
  scenario 'User can view all peeps' do
    sign_up
    expect(current_path).to eq '/profile'
    first_peep
    second_peep
    expect(current_path).to eq '/peep_view'
    expect(page).to have_content('second peep')
    expect(page).to have_content('first peep')
  end
end
