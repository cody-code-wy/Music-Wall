class Member < ActiveRecord::Base

  has_many :songs
  has_many :comments
  has_many :upvotes

  validates :username, presence: true
  validates :password, presence: true

  def has_upvote(songid)
    upvotes.any? do |upvote|
      upvote.song.id == songid if upvote.song
    end
  end
end
