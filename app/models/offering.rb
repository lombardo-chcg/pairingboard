class Offering < ActiveRecord::Base
  belongs_to :mentor, class_name: 'User'
  has_one :appointment
  AVAILABLE_OFFERING_TIMES = ["9:00", "9:30", "10:00", "10:30", "11:00", "11:30", "12:00", "12:30", "1:00", "1:30", "2:00", "2:30", "3:00", "3:30", "4:00", "4:30", "5:00"]


# returns DateTime for upcoming saturday
# require 'date'

def date_of_next(day)
  date  = Date.parse(day)
  delta = date > Date.today ? 0 : 7
  date + delta
end


# date_of_next "Saturday"


end
