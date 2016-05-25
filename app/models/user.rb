class User < ActiveRecord::Base
  has_many :offerings, foreign_key: :mentor_id
  has_many :appointments, foreign_key: :student_id

  has_secure_password

end
