class ConversationsController < ApplicationController

  def index
    @user = User.find(session[:user_id])
    user_id = User.find(session[:user_id]).id
    p conversations = @user.conversations
    p other_person_id = Conversation.get_sender_id(user_id, conversations )
    p @name = Conversation.sender_name(other_person_id)
  end

  def show
    conversation = Conversation.find(params[:id])
    @messages = conversation.messages
  end

  def new
    @message = Message.new
  end
end
