class AddOnceADayFlagToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :once_a_day, :boolean, default: false
  end
end
