class Offering < ActiveRecord::Base
  belongs_to :mentor, class_name: 'User'
  has_one :appointment

end
