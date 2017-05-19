class CreateProjects < ActiveRecord::Migration[5.0]
  has_many :task
  has_many :user
  def change
    create_table :projects do |t|
      t.string :name
      t.string :description
      t.date :start_date
      t.date :final_date

      t.timestamps
    end
  end
end
