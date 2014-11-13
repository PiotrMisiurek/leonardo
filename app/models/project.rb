class Project < ActiveRecord::Base
  belongs_to :user
  has_many :working_hours, dependent: :destroy
  has_many :tasks, dependent: :destroy

  def choice
    { name => weight }
  end

  def self.choice
    Project.all.inject({}) { |choice, project| choice.merge(project.choice) }
  end
end
