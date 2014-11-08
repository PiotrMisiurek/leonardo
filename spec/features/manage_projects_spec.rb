require 'rails_helper'

feature "manage projects", type: :feature do
  before(:each) do
    user = create(:user)
    login_as(user)
  end

  scenario 'create' do
    visit '/projects'
    click_link 'New'
    fill_in 'Name', with: 'test'
    fill_in 'Weight', with: 100
    click_button 'Create Project'
    expect(page).to have_content('Project was successfully created.')
    expect(page).to have_content('test')
    expect(page).to have_content('100')
  end

end
