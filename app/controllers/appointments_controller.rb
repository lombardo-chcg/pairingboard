class AppointmentsController < ApplicationController

  def create
    mentor = User.find(params[:user])
    time = params[:time]
    offering = Offering.find_by(mentor_id: mentor.id, start_time: time, offering_date: date_of_next_saturday)
    appointment = Appointment.new(offering_id: offering.id, student_id: current_user.id)
    if request.xhr?
      if appointment.save
        render json: {appointment: true, appointmentId: appointment.id, offeringId: offering.id}
      else
        error = appointment.errors.messages
        render json: { message: error }, status: 422
      end
    else
      #non ajax response
    end
  end

  def show
    mentor = User.find(params[:user])
    time = params[:time]
    offering = Offering.find_by(mentor_id: mentor.id, start_time: time, offering_date: date_of_next_saturday)
    appointment = Appointment.find_by(offering_id: offering.id, student_id: offering.appointment.student_id)
    if appointment.student_id == current_user.id
      appointment_holder = true
    else
      appointment_holder = false
    end
    if request.xhr?
        render json: {mentor: mentor.name, student: appointment.student.name, appointmentHolder: appointment_holder, appointmentId: appointment.id }
    else
      # non ajax goes here
    end
  end

  def destroy
    appointment = Appointment.find(params[:id])
    appointment_id = appointment.id
    offering_id = appointment.offering.id
    if appointment.student_id == current_user.id
      appointment.destroy
      if request.xhr?
        render json: {appointment: true, offeringId: offering_id, appointmentId: appointment_id}
      else
        redirect_to '/'
      end
    else
      redirect_to '/'
    end
  end

end
