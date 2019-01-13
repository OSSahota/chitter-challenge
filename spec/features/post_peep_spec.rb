feature 'Posting a peep' do
  scenario 'User posts a new peep' do

    visit '/profile'
    click_on 'New Peep'
    expect(current_path).to eq '/peep_new'
    fill_in 'peep', with: 'first peep'
    # fill_in 'name', with: 'first user'
    # fill_in 'username', with: 'userf'
    click_on 'Post Peep'
    expect(current_path).to eq '/peep_view'
    expect(page).to have_content('first peep')
 end
end
