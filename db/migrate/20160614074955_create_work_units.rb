class CreateWorkUnits < ActiveRecord::Migration[5.0]
  def change
    create_table :work_units do |t|
      t.references :project, foreign_key: true
      t.string :name
      t.text :description
      t.integer :progress
      t.integer :estimated_hours
      t.datetime :deadline
      t.integer :status
      t.integer :time_worked

      t.timestamps
    end
  end
end
