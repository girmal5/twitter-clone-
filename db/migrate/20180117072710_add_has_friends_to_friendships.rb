class AddHasFriendsToFriendships < ActiveRecord::Migration[5.1]
  def change
    add_column :friendships, :has_friends, :boolean, :default => false

  end
end
