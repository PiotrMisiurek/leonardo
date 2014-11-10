class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.integer :project_id
      t.string :name
      t.boolean :done, default: false

      t.timestamps
    end
  end
end
