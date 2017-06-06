class AddProjectToTask < ActiveRecord::Migration[5.0]
  def change
  	add_reference :tasks, :project, index: true
  end
end
