class AddUsernameToFriendships < ActiveRecord::Migration[5.1]
  def change
    add_column :friendships, :username, :string

  end
end
