class CreateNotes < ActiveRecord::Migration
  def change
    create_table :notes do |t|
      t.string :title
      t.text :body
      t.references :user, index: true
      t.references :plan, index: true
      t.references :plot, index: true

      t.timestamps
    end
  end
end
