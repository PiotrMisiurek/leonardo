require 'rails_helper'

feature 'manage tasks', type: :feature do
  let!(:user) { create(:user) }
  let!(:project) { create(:project, user: user) }
  before(:each) { login_as(user) }

  scenario 'create' do
    visit projects_path
    click_link project.name
    click_link 'Add new task'
    fill_in 'Name', with: 'Sample of example'
    click_button 'Create Task'
    expect(page).to have_content(project.name)
    expect(page).to have_content('Task was successfully created')
    expect(page).to have_content('Sample of example')
  end
end