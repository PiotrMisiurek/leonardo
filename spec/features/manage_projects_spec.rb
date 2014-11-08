require 'rails_helper'

feature "manage projects", type: :feature do
  let!(:user) { create(:user) }
  let!(:login_user) { login_as(user) }

  scenario 'create' do
    visit '/projects'
    click_link 'New'
    fill_in_project_form 'test', 100
    click_button 'Create Project'
    expect(page).to have_content('Project was successfully created.')
    expect_to_see_project('test', 100)
  end

  scenario 'update' do
    project_setup
    click_link 'Edit'
    fill_in_project_form 'updated', 200
    click_button 'Update Project'
    expect(page).to have_content('Project was successfully updated.')
    expect_to_not_see_project('test', 100)
    expect_to_see_project('updated', 200)
  end

  scenario 'destroy' do
    project_setup
    click_link 'Delete'
    expect(page).to have_content('Project was successfully destroyed.')
    expect_to_not_see_project('test', 100)
  end

  scenario 'choose' do
    project_setup
    click_link 'CHOOSE PROJECT'
    expect(page).to have_content('Current project: test')
  end

  def project_setup
    project = create(:project, user: user, name: 'test', weight: 100)
    visit '/projects'
    expect_to_see_project('test', 100)
  end

  def fill_in_project_form(name, weight)
    fill_in 'Name', with: name
    fill_in 'Weight', with: weight
  end

  def expect_to_see_project(name, weight)
    expect(page).to have_content(name)
    expect(page).to have_content(weight)
  end

  def expect_to_not_see_project(name, weight)
    expect(page).to_not have_content(name)
    expect(page).to_not have_content(weight)
  end

end

