class CreateWorkingHours < ActiveRecord::Migration
  def change
    create_table :working_hours do |t|
      t.integer :project_id
      t.boolean :done

      t.timestamps
    end
  end
end
