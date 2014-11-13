require 'rails_helper'

describe Project do

  describe 'self.choice' do
    let!(:project_1) { create(:project, name: 'project_1', weight: 100) }
    let!(:project_2) { create(:project, name: 'project_2', weight: 300) }
    subject { Project.choice }
    it { is_expected.to include(project_1.choice) }
    it { is_expected.to include(project_2.choice) }
  end

end