module ApplicationHelper

  def current_user
    @current_user ||= User.find(session[:user_id])
  end

  def logged_in?
    return true if session[:user_id] != nil
  end

  def require_login
    unless logged_in?
      flash[:danger] = "You must be logged in to access this section!"
      redirect_to login_path
    end
  end


  def display_sender_name(sender_id)
    User.find(sender_id).name
  end

  def date_of_next_saturday
    date  = Date.parse('Saturday')
    delta = date > Date.today ? 0 : 7
    date + delta
  end

  def notify_mentor_appointment(student, mentor, offering, action)
    conversation = student.find_conversation(mentor)
    message_hash = { "create" => "Hey #{mentor.name}, #{student.name} just booked an appointment with you on #{offering.offering_date} at #{offering.start_time}! Eat some Frosted Fronks, they're GRRRRRRREEEAATTTTT!!!", "destroy" => "Hey #{mentor.name}, #{student.name} just cancelled an appointment with you on #{offering.offering_date} at #{offering.start_time}! Don't be sad, mentor! Your mentor slot is still open for other students to book." }
    if conversation
      @message = conversation.messages.create(sender_id: student.id, body: message_hash[action], conversation_id: conversation.id)
    else
      new_conversation = Conversation.create(creator_id: student.id, joiner_id: mentor.id)
      @message = new_conversation.messages.create(sender_id: student.id, body: message_hash[action])
    end
  end

end
