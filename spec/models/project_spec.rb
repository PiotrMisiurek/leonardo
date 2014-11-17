require 'rails_helper'

describe Project do

  describe 'self.choice' do
    let!(:project_1) { create(:project, name: 'project_1', weight: 100) }
    let!(:project_2) { create(:project, name: 'project_2', weight: 300) }
    subject { Project.choice }
    it { is_expected.to include(project_1.choice) }
    it { is_expected.to include(project_2.choice) }
  end

  describe 'current weight' do
    let(:project) { create(:project) }
    subject { project.current_weight }
    it { is_expected.to eq(project.weight) }
  end

end