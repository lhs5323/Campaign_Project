class RemoveProgressFromTemplates < ActiveRecord::Migration
  def change
    remove_column :task_templates, :progress
  end
end
