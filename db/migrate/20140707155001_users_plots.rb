class UsersPlots < ActiveRecord::Migration
  def change
      create_table :users_plots, :id=>false do |t|
          t.integer :user_id
          t.integer :plot_id
      end
  end
end
