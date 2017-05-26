class MakeUidLonger < ActiveRecord::Migration
  def change
      remove_column :volunteers, :user_ID
      add_column :volunteers, :user_ID, 'bigint'
  end
end
