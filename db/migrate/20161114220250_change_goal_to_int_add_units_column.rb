class ChangeGoalToIntAddUnitsColumn < ActiveRecord::Migration
  def change
      remove_column :task_templates, :goal
      add_column :task_templates, :goal, :integer
      remove_column :tasks, :goal
      add_column :tasks, :goal, :integer
      add_column :task_templates, :units, :string
      add_column :tasks, :units, :string
  end
end
