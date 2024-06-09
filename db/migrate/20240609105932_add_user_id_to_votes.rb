class AddUserIdToVotes < ActiveRecord::Migration[7.1]
  def change
    add_column :votes, :user_id, :integer
  end
end
