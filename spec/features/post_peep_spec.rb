feature 'Posting a peep' do
  scenario 'User posts a new peep' do
    visit '/'
    click_on 'New Peep'
    visit '/new'
    fill_in 'peep', with: 'First peep'
    fill_in 'user', with: 'User A'
    click_on 'Post Peep'
    expect(current_path).to eq '/'
    expect(page).to have_content('First peep')
 end
end
