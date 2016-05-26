class ConversationsController < ApplicationController

  def index
    @user = User.find(session[:user_id])
    user_id = User.find(session[:user_id]).id
    p conversations = @user.conversations
    p other_person_id = Conversation.get_sender_id(user_id, conversations )
    p @name = Conversation.sender_name(other_person_id)
    @conversation = Conversation.first
  end

  def show
    conversation = Conversation.find(params[:id])
    @messages = conversation.messages
  end

  def new
    @message = Message.new
  end

  def create
    # returns all conversations of the recipient
    recipient = User.find_by(id: params[:user_id])
    sender_id = session[:user_id]
    conversations = User.find(recipient).conversations
    conversation_id = Conversation.conversation_exist(conversations,sender_id)

    if conversation_id
      @message = Message.new(sender_id: session[:user_id], body: params[:message][:body], conversation_id: conversation_id)
      if @message.save
        redirect_to user_path(recipient)
      else
        render 'new'
      end

    else
      new_conversation = Conversation.create()
      @message = Message.new(sender_id: session[:user_id], body: params[:message][:body], conversation_id: new_conversation.id)

      if @message.save
        redirect_to user_path(recipient)
      else
        render 'new'
      end
    end

    # if a conversation already exists with the recipient, then use that existing conversation_id
    # else create a new Conversation object and add sender as the user_id, and add new conversation_id to current message
  end
end
