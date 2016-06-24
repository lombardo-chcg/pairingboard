class Appointment < ActiveRecord::Base
  belongs_to :student, class_name: 'User'
  belongs_to :offering

  validates :offering, :student, presence: true
  
  validate :unique_student_and_mentor
  validate :check_student_bookings
  validate :only_one_appointment_at_once
  validate :higher_phase


  def mentor
    offering.mentor
  end

  def unique_student_and_mentor
    if mentor == student
      errors.add(:student, "Can't book your own appointment!")
    end
  end

  def check_student_bookings
    mentors = []
    student.student_appointments.each do |appointment|
      mentors << appointment.offering.mentor
    end
    current_user_appointments = 0
    mentors.each do |m|
      if m == mentor
        current_user_appointments += 1
      end
    end
    if current_user_appointments == 2
      errors.add(:student, "Can only book one hour per mentor per day!")
    else
      return true
    end
  end

  def only_one_appointment_at_once
    times = []
    student.student_appointments.each do |appointment|
      times << appointment.offering.start_time
    end
    current_user_appointments_at_time = 0
    times.each do |begin_time|
      if offering.start_time == begin_time
        current_user_appointments_at_time += 1
      end
    end
    if current_user_appointments_at_time > 0
      errors.add(:student, "Can only have one appointment at that time!")
    else
      return true
    end
  end

  def higher_phase
    if mentor.current_phase <= student.current_phase
      errors.add(:student, "Your mentor can't be in a lower phase!")
    else  
      return true
    end
  end
end




