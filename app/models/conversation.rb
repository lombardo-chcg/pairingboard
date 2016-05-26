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

  def self.conversation_exist(conversations, sender_id)
    # iterate over all the recipient's conversations
    conversations.each do |conversation|
    # for each conversation, look into message
      conversation.messages.each do |message|
    # for each message, check if the session_id is eql to the sender_id
        if message.sender_id == sender_id
    # if there is a match, return the conversation_id
          return message.conversation_id
        end
      end
    end
    return nil
  end

end
