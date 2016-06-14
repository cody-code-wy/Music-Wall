class Upvote < ActiveRecord::Base
  belongs_to :member
  belongs_to :song

  validate :one_for_member

  private
  def one_for_member
    match = member.upvotes.any? do |upvote|
      upvote.song.id == self.song.id
    end
    if match
      errors.add(:member, "Must not have an upvote for same song.")
    end
  end
end
