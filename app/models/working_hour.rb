class WorkingHour < ActiveRecord::Base
  belongs_to :project

  scope :in_progress, -> { where(done: false) }

  def should_be_done?
    !done? and created_at < 1.hour.ago
  end
end
