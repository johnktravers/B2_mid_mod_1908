require 'rails_helper'

RSpec.describe 'students index page', type: :feature do

  before :each do
    @barb = Student.create(name: 'Barb Schicke', cohort_num: '1906', age: 32)
    @nick = Student.create(name: 'Nicholas Piere', cohort_num: '1904', age: 27)

    @erin = Instructor.create(name: 'Erin Hampton')
    @greg = Instructor.create(name: 'Greg Davis')
    @rose = Instructor.create(name: 'Rose Sanders')

    InstructorStudent.create(instructor_id: @erin.id, student_id: @nick.id)
    InstructorStudent.create(instructor_id: @greg.id, student_id: @barb.id)
    InstructorStudent.create(instructor_id: @rose.id, student_id: @barb.id)
    InstructorStudent.create(instructor_id: @rose.id, student_id: @nick.id)
  end

  it 'can see all students and their name, cohort, and instructors' do
    visit '/students'

    within "#student-#{@barb.id}" do
      expect(page).to have_content(@barb.name)
      expect(page).to have_content("Cohort: #{@barb.cohort_num}")
      expect(page).to have_content("Instructors:\n#{@greg.name} #{@rose.name}")
    end

    within "#student-#{@nick.id}" do
      expect(page).to have_content(@nick.name)
      expect(page).to have_content("Cohort: #{@nick.cohort_num}")
      expect(page).to have_content("Instructors:\n#{@erin.name} #{@rose.name}")
    end
  end

  it 'can click an instructors name to go to their show page' do
    visit '/students'
    within("#student-#{@barb.id}") { click_link(@greg.name) }
    expect(current_path).to eq("/instructors/#{@greg.id}")

    visit '/students'
    within("#student-#{@nick.id}") { click_link(@erin.name) }
    expect(current_path).to eq("/instructors/#{@erin.id}")
  end

end
