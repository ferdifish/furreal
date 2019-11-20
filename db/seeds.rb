# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'
puts 'Cleaning database...'

Review.destroy_all
Booking.destroy_all
Pet.destroy_all
User.destroy_all

numbers = [1..20]
10.times do
 User.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, email: Faker::Internet.email, password: '123123', location: "SW#{rand(1..20)}")
end

# User. = User.create(first_name: 'test', last_name: 'test', email: 'test@test.com', password: '123123', location: 'townsville' )
# test_pet = Pet.create(name:'Clifford', price_per_day: 100, description: "Big and red. Needs lots of food.", species: 'Dog', photo: 'https://images.unsplash.com/photo-1553776590-89774e24b34a?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1567&q=80', user: test_user)
# test_booking = Booking.create(start_date: Date.new(2019,11,19), end_date: Date.new(2019,11,20), pet: test_pet)
pets_array = [
  {
    name:           'Rex',
    price_per_day:   25,
    description:    'Pretty cool dog. Old.',
    species:        'Dog',
    photo:          'https://images.unsplash.com/photo-1561984142-7fabd0b4c9b4?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=934&q=80',
    user:           User.all.sample
  },
  {
    name:           'Cat',
    price_per_day:   8,
    description:    'This is a cat.',
    species:        'Cat',
    photo:          'https://images.unsplash.com/photo-1548681528-6a5c45b66b42?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=934&q=80',
    user:           User.all.sample
  },
  {
    name:           'Snowy',
    price_per_day:   46,
    description:    'Lovely dog. Moody.',
    species:        'Dog',
    photo:          'https://images.unsplash.com/photo-1553776590-89774e24b34a?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1567&q=80',
    user:           User.all.sample
  },
  {
    name:           'Lucky',
    price_per_day:   50,
    description:    'Good pet. 7/10.',
    species:        'Dog',
    photo:          'https://images.unsplash.com/photo-1558233043-45af001ed5b7?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1950&q=80',
    user:           User.all.sample
  },
  {
    name:           'Benji',
    price_per_day:   5,
    description:    "This is a lizard. He's alright.",
    species:        'Lizard',
    photo:          'https://images.unsplash.com/photo-1504450874802-0ba2bcd9b5ae?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1400&q=80',
    user:           User.all.sample
  }

]
Pet.create!(pets_array)

bookings_array = [
  {
    start_date:     Date.new(2019,11,19),
    end_date:       Date.new(2019,11,20),
    pet:            Pet.all.sample,
    user:           User.all.sample
  },
  {
    start_date:     Date.new(2019,10,23),
    end_date:       Date.new(2019,10,26),
    pet:            Pet.all.sample,
    user:           User.all.sample
  },
  {
    start_date:     Date.new(2019,11,10),
    end_date:       Date.new(2019,11,12),
    pet:            Pet.all.sample,
    user:           User.all.sample
  }
]

Booking.create!(bookings_array)

reviews_array = [
  {
    content:        "Best cat ever!",
    rating:         5,
    booking:        Booking.first
  },
  {
    content:        "Funny feline!",
    rating:         4,
    booking:        Booking.last
  },
]

Review.create!(reviews_array)

puts 'Finished!'
