class SetWorkingHoursDoneToFalseByDefault < ActiveRecord::Migration
  def change
    change_column :working_hours, :done, :boolean, default: false
  end
end
