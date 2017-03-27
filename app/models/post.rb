class Post < ApplicationRecord
  belongs_to :user
  validates :content, presence: true
  has_many :likes
end
