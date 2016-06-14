class Song < ActiveRecord::Base

  belongs_to :member

  has_many :upvotes
  has_many :comments


  validates :title, presence: true
  validates :author, presence: true
end
