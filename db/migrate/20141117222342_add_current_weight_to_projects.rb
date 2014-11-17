class AddCurrentWeightToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :current_weight, :integer
  end
end
