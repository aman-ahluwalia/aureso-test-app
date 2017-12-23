# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Car.create(slug: 'subaru_impreza', max_speed: 280, speed_unit: 'km/h')
5.times do |_|
  Car.create(slug: Faker::Lorem.word, max_speed: Faker::Number.between(200, 300), speed_unit: 'km/h')
end

snow = Factor.create(property: 'surface_type', kind: 'snow', resistance: Faker::Number.between(1, 35))
gravel = Factor.create(property: 'surface_type', kind: 'gravel', resistance: Faker::Number.between(1, 35))
asphalt = Factor.create(property: 'surface_type', kind: 'asphalt', resistance: Faker::Number.between(1, 35))
Factor.create(property: 'time_of_the_day', kind: '0.00 - 6.00', resistance: 15)
Factor.create(property: 'time_of_the_day', kind: '6.00 - 9.00', resistance: 8)
Factor.create(property: 'time_of_the_day', kind: '9.00 - 18.00', resistance: 0)
Factor.create(property: 'time_of_the_day', kind: '18.00 - 21.30', resistance: 8)
Factor.create(property: 'time_of_the_day', kind: '21.30 - 24.00', resistance: 15)

Track.create(name: 'Nurburgring', country: 'Germany', timezone: '+0:00', factor:[snow, gravel, asphalt].sample)
Track.create(name: 'Sydney Motorsport Park', country: 'Australia', timezone: '+10:00', factor:[snow, gravel, asphalt].sample)
Track.create(name: 'Circuit Gilles Villenaeuve', country:'Canada', timezone: '-05:00', factor:[snow, gravel, asphalt].sample)
Track.create(name: 'Guia Circut', country:'Macau', timezone: '+08:00', factor:[snow, gravel, asphalt].sample)
