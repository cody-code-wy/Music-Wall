class Member < ActiveRecord::Base

  has_many :upvotes

  validates :username, presence: true
  validates :password, presence: true
end
