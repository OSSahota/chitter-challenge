require_relative 'web_helper'

feature 'Posting a peep' do
  scenario 'User posts a new peep' do
    sign_up
    expect(current_path).to eq '/profile'
    first_peep
    expect(current_path).to eq '/peep_view'
    expect(page).to have_content('first peep')
 end
end
