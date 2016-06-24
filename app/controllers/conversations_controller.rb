class ConversationsController < ApplicationController
  before_action :require_login
#conversations are only displayed on a profile page once the user has received a message
  def index
    #find the current user object
    @user = User.find(session[:user_id])
    #get the id of current user
    user_id = User.find(session[:user_id]).id
    #get all conversations of current user
    @started_conversations = @user.started_conversations
    @joined_conversations = @user.joined_conversations
  end

  def show
    @conversation = Conversation.find(params[:id])
    @messages = @conversation.messages
    @messages.each do |message|
      if current_user.id != message.sender_id
        message.update_attribute(:read, true)
      end 
    end 

    @message = Message.new
  end

  def new
    @message = Message.new
  end

  def create

    if params[:conversation_id]
      conversation = Conversation.find(params[:conversation_id])
    else
      joiner = User.find(params[:user_id])
      conversation = current_user.find_conversation(joiner)
    end

    if conversation
      @message = conversation.messages.new(sender_id: current_user.id, body: params[:message][:body], conversation_id: conversation.id)
      if @message.save
        redirect_to user_conversation_path(current_user, conversation)
      else
        render 'new'
      end
    else
      new_conversation = Conversation.create(creator_id: current_user.id, joiner_id: joiner.id)
      @message = new_conversation.messages.new(sender_id: current_user.id, body: params[:message][:body])
      if @message.save
        redirect_to user_path(joiner)
      else
        render 'new'
      end
    end
  end
end
