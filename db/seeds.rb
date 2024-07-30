# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end


puts '---> Create Teachers'

teacher1 = Teacher.find_or_create_by(first_name: FFaker::Name.first_name, last_name: FFaker::Name.last_name)
teacher2 = Teacher.find_or_create_by(first_name: FFaker::Name.first_name, last_name: FFaker::Name.last_name)
teacher3 = Teacher.find_or_create_by(first_name: FFaker::Name.first_name, last_name: FFaker::Name.last_name)

puts '---> Create Subjects'

science_subject = Subject.find_or_create_by(title: 'Science')
math_subject = Subject.find_or_create_by(title: 'Math')
history_subject = Subject.find_or_create_by(title: 'History')

puts '---> Create Teachers Subjects'

teacher_subject_science = TeacherSubject.find_or_create_by(subject: science_subject, teacher: teacher1)
teacher_subject_math = TeacherSubject.find_or_create_by(subject: math_subject, teacher: teacher2)
teacher_subject_history = TeacherSubject.find_or_create_by(subject: history_subject, teacher: teacher3)

puts '---> Create Classrooms'

north_1 = Classroom.find_or_create_by(room_number: '1', building: 'North')
north_2 = Classroom.find_or_create_by(room_number: '2', building: 'North')
south_3 = Classroom.find_or_create_by(room_number: '3', building: 'South')

puts '---> Create Sections'

Section.find_or_create_by(
  title: 'Chemistry', 
  teacher_subject: teacher_subject_science, 
  classroom: north_1, 
  weekdays: [0,2,4],
  start_at: Time.parse("07:30"),
  end_at: Time.parse("08:20")
)
Section.find_or_create_by(
  title: 'Algebra', 
  teacher_subject: teacher_subject_math, 
  classroom: north_2, 
  weekdays: [0,2,4],
  start_at: Time.parse("07:30"),
  end_at: Time.parse("08:20")
)
Section.find_or_create_by(
  title: 'Geometry', 
  teacher_subject: teacher_subject_math, 
  classroom: north_2, 
  weekdays: [1,3],
  start_at: Time.parse("07:30"),
  end_at: Time.parse("08:20")
)
Section.find_or_create_by(
  title: 'World War II', 
  teacher_subject: teacher_subject_history, 
  classroom: south_3, 
  weekdays: [2],
  start_at: Time.parse("08:00"),
  end_at: Time.parse("08:50")
)

puts '---> Create Student'

Student.find_or_create_by(first_name: FFaker::Name.first_name, last_name: FFaker::Name.last_name)