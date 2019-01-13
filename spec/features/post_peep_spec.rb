feature 'Posting a peep' do
  scenario 'User posts a new peep' do
    visit '/'
    click_on 'New Peep'
    visit '/peep_new'
    fill_in 'peep', with: 'First peep'
    fill_in 'user', with: 'User A'
    click_on 'Post Peep'
    expect(current_path).to eq '/peep_view'
    expect(page).to have_content('User A - First peep')
 end
end
