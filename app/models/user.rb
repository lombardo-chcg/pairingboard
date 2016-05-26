class User < ActiveRecord::Base
  has_many :offerings, foreign_key: :mentor_id
  has_many :appointments, foreign_key: :student_id

  validates :name, :email, presence: true
  validates :email, uniqueness: true
  validates :password, length: {minimum: 8}


  has_secure_password

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
