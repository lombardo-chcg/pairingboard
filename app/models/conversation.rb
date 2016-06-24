class Conversation < ActiveRecord::Base
  belongs_to :user
  has_many :messages

  def self.get_sender(user_id, conversations)
    senders_array = []
    conversations.each do |conversation|
      conversation.messages.each do |message|
        if message.sender_id != user_id
          senders_array << User.find(message.sender_id)
        end
      end
    end
    senders_array.uniq
  end

  def has_unread_messages?(current_user)
    status = false 
    self.messages.each do |message|
      if message.read == false && message.sender_id != current_user.id
        status = true 
      end 
    end 

    return status  
  end 
  # def self.sender_name(other_person_id_array)
  #   other_person_array = []
  #   other_person_id_array.each do |person_id|
  #     other_person_array << User.find(person_id)
  #   end
  #   other_person_array
  # end
###Fucked
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

  #input person object and logged in user's id
  #output conversation where the message's sender id is logged in user's id
  #usage: get all conversations that involve the logged in user
  def self.get_conversation_by_sender(user, person)
      person.conversations.each do |conversation|
        conversation.messages.each do |message|
          if message.sender == user
            return conversation
          end
        end
      end
  end

end
