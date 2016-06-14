class Comment < ActiveRecord::Base

  belongs_to :song
  belongs_to :member

  validates :content, presence: true

end
