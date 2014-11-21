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
    describe 'after create' do
      it { is_expected.to eq(project.weight) }
    end
    describe 'after update' do
      describe 'wieght has been changed' do
        before { project.update_attributes weight: 500 }
        it { is_expected.to eq(project.weight) }
      end
      describe 'weight has not been changed' do
        before do
          project.update_attribute :current_weight, 0
          project.update_attributes name: 'new name'
        end
        it { is_expected.to eq(0) }
      end
    end
  end

end