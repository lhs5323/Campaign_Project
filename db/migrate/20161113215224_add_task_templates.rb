class AddTaskTemplates < ActiveRecord::Migration
  def change
    create_table :task_templates do |t|
      t.integer "task_ID"
      t.integer "duration"
      t.integer "progress"
      t.integer "goal"
      t.integer "points"
      t.string  "task_type"
    end
  end
end
