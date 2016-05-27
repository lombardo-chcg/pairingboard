class Offering < ActiveRecord::Base
  belongs_to :mentor, class_name: 'User'
  has_one :appointment, dependent: :destroy
  AVAILABLE_OFFERING_TIMES = ["9:00", "9:30", "10:00", "10:30", "11:00", "11:30", "12:00", "12:30", "1:00", "1:30", "2:00", "2:30", "3:00", "3:30", "4:00", "4:30"]
  
  validates :mentor, :offering_date, :start_time, presence: true
  validate :mentor_above_phase_one

# returns DateTime for upcoming saturday
# require 'date'

  def date_of_next(day)
    date  = Date.parse(day)
    delta = date > Date.today ? 0 : 7
    date + delta
  end

  def mentor_above_phase_one
    if mentor.current_phase == nil || mentor.current_phase < 2
      errors.add(:mentor, "You need to be in at least Phase 2 to offer a session!")
    else
      return true
    end
  end


# date_of_next "Saturday"


end
