class RemoveHasfriendsFromFriendships < ActiveRecord::Migration[5.1]
  def change
    remove_column :friendships, :hasfriends, :boolean
  end
end
