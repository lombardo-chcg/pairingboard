class Conversation < ActiveRecord::Base
  has_many :conversers
  has_many :users, through: :conversers
  has_many :messages

  def self.get_sender_id(user_id, conversations)

    # @user = User.find(session[:user_id])
    # @conversations = @user.conversations
    conversations.each do |conversation|
      conversation.messages.each do |message|
        if message.sender_id != user_id
          other_person_id = message.sender_id
          return other_person_id
        end
      end
    end

  end

  def self.sender_name(other_person_id)
    return User.find(other_person_id).name
  end
end
