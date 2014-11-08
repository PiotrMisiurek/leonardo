class Project < ActiveRecord::Base
  belongs_to :user
  has_many :working_hours, dependent: :destroy

  def choice
    { name => weight }
  end

  def self.choice
    choice = {}
    self.all.each {|project| choice.merge!(project.choice) }
    choice
  end
end
