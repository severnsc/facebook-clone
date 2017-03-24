class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :friendships, dependent: :destroy
  has_many :friends, through: :friendships
  has_many :notifications
  validates :first_name, presence: true
  validates :last_name, presence: true

  def accepted_friends
    friends.where("accepted = ?", true)
  end

  def pending_friends
    friends.where("accepted = ?", false)
  end
end
