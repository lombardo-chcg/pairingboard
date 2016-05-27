class User < ActiveRecord::Base
  has_many :offerings, foreign_key: :mentor_id
  has_many :appointments, foreign_key: :student_id
  has_many :messages, foreign_key: :sender_id
  has_many :conversers
  has_many :conversations, through: :conversers

  validates :name, :email, presence: true
  validates :email, uniqueness: true
  validates :password, length: {minimum: 8}, :on => :create


  has_secure_password

  def is_offering?(time)
    is_offering = false
    open_offerings.each do |offering|
      if offering.start_time == time
        return offering
      end
    end
    return is_offering
  end

  def is_booked?(time)
    is_booked = false
    mentor_appointments.each do |appointment|
      if appointment.offering.start_time == time
        return appointment
      end
    end
    is_booked = false
  end

  def student_appointments
    return self.appointments
  end

  def mentor_appointments
    mentor_appointments = []
    self.offerings.each do |offering|
      if offering.appointment != nil
        mentor_appointments << offering.appointment
      end
    end
    return mentor_appointments
  end

  def open_offerings
    open_offerings = []
    self.offerings.each do |offering|
      if offering.appointment == nil
        open_offerings << offering
      end
    end
    return open_offerings
  end

end
