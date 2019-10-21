require 'rails_helper'

RSpec.describe 'instructor show page', type: :feature do

  before :each do
    @barb = Student.create(name: 'Barb Schicke', cohort_num: '1906', age: 32)
    @nick = Student.create(name: 'Nicholas Piere', cohort_num: '1904', age: 27)
    @kyle = Student.create(name: 'Kyle Zeigle', cohort_num: '1901', age: 23)
    @brady = Student.create(name: 'Brady Reizen', cohort_num: '1906', age: 43)

    @rose = Instructor.create(name: 'Rose Sanders')
    @greg = Instructor.create(name: 'Greg Davis')

    InstructorStudent.create(instructor_id: @rose.id, student_id: @barb.id)
    InstructorStudent.create(instructor_id: @rose.id, student_id: @nick.id)
    InstructorStudent.create(instructor_id: @rose.id, student_id: @kyle.id)
    InstructorStudent.create(instructor_id: @greg.id, student_id: @brady.id)
  end

  it 'can see instructor name, students names, and average student age' do
    visit "/instructors/#{@rose.id}"

    expect(page).to have_content(@rose.name)
    expect(page).to have_content("Students:\n#{@barb.name} #{@nick.name} #{@kyle.name}")
    expect(page).to have_content('Average Age of Students: 27.3')
  end

  it 'cannot see other instructors students' do
    visit "/instructors/#{@rose.id}"

    expect(page).to_not have_content(@brady.name)
  end

end
