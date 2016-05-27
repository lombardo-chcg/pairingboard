class Message < ActiveRecord::Base
  belongs_to :sender, class_name: 'User'
  belongs_to :conversation

  validates :sender_id, presence: true
  validates :body, presence: true
end
