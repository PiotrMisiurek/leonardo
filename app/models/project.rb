class Project < ActiveRecord::Base
  belongs_to :user
  has_many :working_hours, dependent: :destroy
  has_many :tasks, dependent: :destroy

  before_save :set_current_weight

  def choice
    { name => current_weight }
  end

  def self.choice
    Project.all.inject({}) { |choice, project| choice.merge(project.choice) }
  end

  private

  def set_current_weight
    if self.weight_changed?
      self.current_weight = self.weight
    end
  end
end
