class CreateParticipationsUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :participations_users do |t|
      t.integer :user_id
      t.integer :task_id

      t.timestamps
    end

    add_index :participations_users, :user_id
    add_index :participations_users, :task_id
  end
end
