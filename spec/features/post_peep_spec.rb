feature 'Posting a peep' do
  scenario 'User posts a new peep' do
    visit '/'
    click_on 'New Peep'
    visit '/peep_new'
    fill_in 'Peep', with: 'First peep'
    fill_in 'User', with: 'User A'
    click_on 'Post Peep'
    expect(current_path).to eq '/peep_post'
    expect(page).to have_content('First peep')
 end
end
