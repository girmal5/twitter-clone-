class Post < ApplicationRecord
  belongs_to :user
  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum:140 } #max tweets are 140 characters
  default_scope -> { order(created_at: :desc) } #newest tweets and posts first 
  end
