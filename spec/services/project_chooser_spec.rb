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

  describe 'once a day project' do
    describe 'clears current weight if flag is true' do
      let!(:once_a_day_project) { create(:once_a_day_project) }
      let!(:project_chooser) { ProjectChooser.new(once_a_day_project.user.projects)}
      before(:each) do
        project_chooser.choose
        once_a_day_project.reload
      end
      it { expect(once_a_day_project.current_weight).to eq(0) }
    end
    describe 'does nothing if flag is false' do
      before(:each) do
        project_chooser.choose
        project.reload
      end
      it { expect(project.current_weight).to eq(100) }
    end
  end
end