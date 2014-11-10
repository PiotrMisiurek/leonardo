class WorkingHour < ActiveRecord::Base
  belongs_to :project

  scope :in_progress, -> { where(done: false) }
end
