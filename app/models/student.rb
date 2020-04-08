class Student < ApplicationRecord
  before_save { self.email = email.downcase }
  validates :name, presence: true,
                      length:{minimum: 3 , maximum: 15}
VALID_EMAIL_REGEX= /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
validates :email, presence: true,
                  length:{ maximum: 100},
                  uniqueness: {case_sensitive: false},
                  format: { with: VALID_EMAIL_REGEX }
has_secure_password

has_many :enrollments
has_many :courses, through: :enrollments

end
