class Course < ApplicationRecord

  validates :code, presence: true, length: {minimum: 3, maximum: 15}
  validates :name, presence: true, length: {minimum: 5, maximum: 50}
  validates :description, presence: true, length: {minimum: 25, maximum: 300}

  has_many :enrollments
  has_many :students, through: :enrollments

end
