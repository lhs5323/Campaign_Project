class MakeUidLongTasks < ActiveRecord::Migration
  def change
      remove_column :tasks, :volunteer_id
      add_column :tasks, :volunteer_id, 'bigint'
  end
end
