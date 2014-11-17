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
    expect_to_see_notice('Task was successfully created')
    expect(page).to have_content('Sample of example')
  end

  scenario 'update aka mark as done' do
    visit_project_page_with_task
    click_link 'Mark As Done'
    expect_to_see_notice('Task was successfully marked as done')
    expect_to_not_see_task
  end

  scenario 'remove' do
    visit_project_page_with_task
    click_link 'Remove'
    expect_to_see_notice('Task was successfully removed')
    expect_to_not_see_task
  end

  def visit_project_page_with_task
    @task = create(:task, project: project)
    visit projects_path
    click_link project.name
    expect(find('li h4')).to have_text(@task.name)
  end

  def expect_to_not_see_task
    expect(page).to_not have_selector('li h4')
  end
end