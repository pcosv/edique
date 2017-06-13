class AddImageToTasks < ActiveRecord::Migration[5.0]
  def change
    add_column :tasks, :image, :string
  end
end
