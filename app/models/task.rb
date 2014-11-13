class Task < ActiveRecord::Base
  belongs_to :project

  scope :not_done, -> { where(done: false) }
end
