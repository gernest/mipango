class PlotsUsers < ActiveRecord::Migration
  def change
      create_table :plots_users, :id=>false do |t|
          t.belongs_to :plot
          t.belongs_to :user
      end
  end
end
