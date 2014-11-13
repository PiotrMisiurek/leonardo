require 'rails_helper'

describe ProjectChooser do
  let!(:user) { create(:user) }
  let!(:project) { create(:project, user: user) }
  let!(:project_chooser) { ProjectChooser.new(user.projects) }

  it { expect { project_chooser.choose }.to change{ project.working_hours.count }.by(1) }

  describe 'choose project only from collection that got in params' do
    let!(:empty_user) { create(:user) }
    it { expect(ProjectChooser.new(empty_user.projects).choose).to eq(nil) }
  end
end