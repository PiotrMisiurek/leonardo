require 'rails_helper'

feature "manage projects", type: :feature do
  before(:each) do
    @user = create(:user)
    login_as(@user)
  end

  scenario 'create' do
    visit '/projects'
    click_link 'New'
    fill_in_project_form 'test', 100
    click_button 'Create Project'
    expect(page).to have_content('Project was successfully created.')
    expect_to_see_project('test', 100)
  end

  scenario 'update' do
    project = create(:project, user: @user, name: 'test', weight: 100)
    visit '/projects'
    expect_to_see_project('test', 100)
    click_link 'Edit'
    fill_in_project_form 'updated', 200
    click_button 'Update Project'
    expect_to_not_see_project('test', 100)
    expect_to_see_project('updated', 200)
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

