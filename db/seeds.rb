# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

barb = Student.create(name: 'Barb Schicke', cohort_num: '1906', age: 32)
nick = Student.create(name: 'Nicholas Piere', cohort_num: '1904', age: 27)
kyle = Student.create(name: 'Kyle Zeigle', cohort_num: '1901', age: 23)

erin = Instructor.create(name: 'Erin Hampton')
greg = Instructor.create(name: 'Greg Davis')
rose = Instructor.create(name: 'Rose Sanders')

InstructorStudent.create(instructor_id: erin.id, student_id: nick.id)
InstructorStudent.create(instructor_id: erin.id, student_id: kyle.id)
InstructorStudent.create(instructor_id: greg.id, student_id: barb.id)
InstructorStudent.create(instructor_id: greg.id, student_id: kyle.id)
InstructorStudent.create(instructor_id: rose.id, student_id: barb.id)
InstructorStudent.create(instructor_id: rose.id, student_id: nick.id)
