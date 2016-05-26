class Offering < ActiveRecord::Base
  belongs_to :mentor, class_name: 'User'
  has_one :appointment


# returns DateTime for upcoming saturday
# require 'date'

# def date_of_next(day)
#   date  = Date.parse(day)
#   delta = date > Date.today ? 0 : 7
#   date + delta
# end


# date_of_next "Saturday"


end
