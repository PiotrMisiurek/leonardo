class Project < ActiveRecord::Base
  belongs_to :user

  def choice
    { name => weight }
  end

  def self.choice
    choice = {}
    self.all.each {|project| choice.merge!(project.choice) }
    choice
  end
end
