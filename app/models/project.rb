class Project < ActiveRecord::Base

  def choice
    { name => weight }
  end

  def self.choice
    choice = {}
    self.all.each {|project| choice.merge!(project.choice) }
    choice
  end
end
