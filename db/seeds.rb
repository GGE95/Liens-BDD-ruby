# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

Doctor.destroy_all
Patient.destroy_all
Appointment.destroy_all
JoinTableDoctorSpeciality.destroy_all

require 'faker'
100.times do
  doctor = Doctor.create!(first_name: Faker::Name.name, last_name: Faker::Name.name, zip_code: Faker::Alphanumeric.alphanumeric(number: 10))
end

100.times do
  patient = Patient.create!(first_name: Faker::Name.name, last_name: Faker::Name.name)
end

100.times do
  city = City.create!(name: Faker::WorldCup.city)
end

100.times do
  speciality = Speciality.create!(name: Faker::Games::Witcher.witcher)
end

100.times do
  join = JoinTableDoctorSpeciality.create!(doctor_id: rand(1..100), speciality_id: rand(1..100))
end

1000.times do
  appointment = Appointment.create!(date: Faker::Date.between(from: '2014-09-23', to: '2024-09-25'), doctor_id: rand(1..100), patient_id: rand(1..100), city_id: rand(1..100))
end