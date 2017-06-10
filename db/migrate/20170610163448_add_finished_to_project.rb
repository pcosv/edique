class AddFinishedToProject < ActiveRecord::Migration[5.0]
  def change
    add_column :projects, :finished, :boolean, :default => false
  end
end
