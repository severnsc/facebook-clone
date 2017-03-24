class Notification < ApplicationRecord
  belongs_to :user
  belongs_to :sender, class_name: 'User'

  def self.unchecked
    where('checked = ?', false)
  end
end
