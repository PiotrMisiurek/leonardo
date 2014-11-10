require 'rails_helper'

describe ProjectChooser do
  let!(:project) { create(:project) }
  let!(:project_chooser) { ProjectChooser.new(Project.all) }

  it { expect { project_chooser.choose }.to change{ project.working_hours.count }.by(1) }
end