class AddSecretKey < ActiveRecord::Migration
  def change
      add_column :volunteers, :twitter_secret_key, :string
  end
end
