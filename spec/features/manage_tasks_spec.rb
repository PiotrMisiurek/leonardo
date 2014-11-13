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

  scenario 'update aka mark as done' do
    task = create(:task, project: project)
    visit projects_path
    click_link project.name
    expect(page).to have_text(task.name)
    click_link 'Mark As Done'
    expect(page).to have_text('Task was successfully marked as done')
    expect(page).to_not have_text(task.name)
  end
end