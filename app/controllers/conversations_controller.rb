class ConversationsController < ApplicationController
#conversations are only displayed on a profile page once the user has received a message
  def index
    #find the current user object
    @user = User.find(session[:user_id])
    #get the id of current user
    user_id = User.find(session[:user_id]).id
    #get all conversations of current user
    conversations = @user.conversations
    all = Converser.all
    p all


    #go through all messages in a conversation until the recipient id is found, return the recipient id
    @senders_array = Conversation.get_sender(user_id, conversations)
    #using the recipient id, get the recipient's name

    # @other_person_array = Conversation.sender_name(other_person_id_array)
    p @senders_array
  end

  def show
    @conversation = Conversation.find(params[:id])
    @messages = @conversation.messages
  end

  def new
    @message = Message.new
  end

  def create
    # returns all conversations of the recipient
    recipient = User.find(params[:user_id])
    sender_id = session[:user_id]

    conversations = recipient.conversations
    # puts "=================#{conversations.first.messages.last.body}============"
    conversation_id = Conversation.conversation_exist(conversations,sender_id)
    # p conversation_id

    # conversation_id = Conversation.conversation_exist(conversations,sender_id)
    if conversation_id
      @message = Message.new(sender_id: session[:user_id], body: params[:message][:body], conversation_id: conversation_id)
      ###Conversation.find(conservation_id).conversers.create(user_id: XXXXX)
      ###Currently, only the sender is tied to a message that is tied to a conversation
      ###We should associate the recipient with a conversation through Converser
      if @message.save
        redirect_to user_path(recipient)
      else
        render 'new'
      end

    else
      new_conversation = Conversation.create()
      # @message = Message.new(sender_id: session[:user_id], body: params[:message][:body], conversation_id: new_conversation.id)
      @message = new_conversation.messages.new(sender_id: session[:user_id], body: params[:message][:body])
###Conversation.find(conservation_id).conversers.create(user_id: XXXXX)
      if @message.save
        # new_conversation.save
        redirect_to user_path(recipient)
      else
        render 'new'
      end
    end

    # if a conversation already exists with the recipient, then use that existing conversation_id
    # else create a new Conversation object and add sender as the user_id, and add new conversation_id to current message
  end
end
