class Drop < ActiveRecord::Migration[5.1]
  def change

    drop_table :friend_requests
    drop_table :friendships
    drop_table :friendship1s

  end
end
