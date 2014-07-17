class CreatePlots < ActiveRecord::Migration
  def change
    create_table :plots do |t|
      t.string :title
      t.text :body
      t.integer :parent_plot, default: 0, null: false

      t.references :plan, index: true
      t.timestamps
    end
  end
end
