class CreateCompletedUserVotes < ActiveRecord::Migration
  def change
    create_table :completed_user_votes do |t|
      t.integer :user_id
      t.integer :iteration_id

      t.timestamps
    end
  end
end
