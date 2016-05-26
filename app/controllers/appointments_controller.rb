class AppointmentsController < ApplicationController

  def create
    mentor = User.find(params[:user])
    time = params[:time]
    offering = Offering.find_by(mentor_id: mentor.id, start_time: time, offering_date: date_of_next_saturday)
    Appointment.create!(offering_id: offering.id, student_id: current_user.id)
  end
end
