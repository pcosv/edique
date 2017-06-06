class CreateTasks < ActiveRecord::Migration[5.0]
  def change
    create_table :tasks do |t|
      t.string :name
      t.string :description
      t.date :final_date
      t.string :task_report

      t.references :project

      t.timestamps
    end
  end
end
