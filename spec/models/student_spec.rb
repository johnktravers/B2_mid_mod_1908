require 'rails_helper'

RSpec.describe Student, type: :model do

  describe 'validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :cohort_num }
    it { should validate_presence_of :age }

    it { should validate_numericality_of(:cohort_num).only_integer }
    it { should validate_numericality_of(:age).only_integer }

    it { should validate_length_of(:cohort_num).is_equal_to(4) }
  end

  describe 'relationships' do
    it { should have_many(:instructors).through(:instructor_students) }
  end

  describe 'class methods' do
    it 'can calculate the average age of a group of students' do
      Student.create(name: 'Barb Schicke', cohort_num: '1906', age: 32)
      Student.create(name: 'Nicholas Piere', cohort_num: '1904', age: 27)
      Student.create(name: 'Brady Fleck', cohort_num: '1901', age: 31)

      expect(Student.average_age).to eq(30)
    end
  end

end
