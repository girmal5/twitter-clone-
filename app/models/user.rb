class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

         has_many :posts, dependent: :destroy #if user deleted his associated posts also are deleted
         has_many :active_relationships, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
         has_many :passive_relationships, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy

         has_many :following, through: :active_relationships, source: :followed
         has_many :followers, through: :passive_relationships, source: :follower

         has_many :friendships
         has_many :friends, :through => :friendships
         has_many :inverse_friendships, :class_name => "Friendship", :foreign_key => "friend_id"
         has_many :inverse_friends, :through => :inverse_friendships, :source => :user


         def follow(other)
           active_relationships.create(followed_id: other.id)
         end

         def unfollow(other)
           active_relationships.find_by(followed_id: other.id).destroy
         end

         def following?(other)
           following.include?(other)
         end

end
