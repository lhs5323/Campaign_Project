class UpdateTableName < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.integer :task_ID
      t.references :volunteer
      t.string :task_type
      t.integer :duration
      t.integer :progress
      t.integer :goal
      t.integer :points
    end
    create_table :volunteers do |t|
      t.string :name
      t.string :twitter_key
      t.integer :user_ID, :limit => 8
    end
    create_table :directors do |t|
      t.string :name
      t.string :email
    end
  end
end