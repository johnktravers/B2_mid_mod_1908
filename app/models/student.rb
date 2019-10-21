class Student < ApplicationRecord
  validates_presence_of :name, :cohort_num, :age

  validates_numericality_of :cohort_num, only_integer: true
  validates_numericality_of :age, only_integer: true

  validates_length_of :cohort_num, is: 4

  has_many :instructor_students
  has_many :instructors, through: :instructor_students

  def self.average_age
    average(:age)
  end
end
