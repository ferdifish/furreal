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

# User creation
numbers = [1..20]
20.times do
 User.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, email: Faker::Internet.email, password: '123123', location: "SW#{rand(1..20)}")
end
clifford_user = User.create(first_name: 'Clifford', last_name: 'Mum', email: 'clifford@test.com', password: '123123', location: "SW1" )
test_user = User.create(first_name: 'test', last_name: '<t>q</t>est', email: 'test@test.com', password: '123123', location: "SW1" )

# Pets Creation

clifford_pet = Pet.create({
    name:           'Clifford',
    price_per_day:   25,
    description:    'Pretty cool dog. Old.',
    species:        'Dog',
    user:           clifford_user
  })

pets_array = [
  {
    name:           'Rex',
    price_per_day:   25,
    description:    'Closest thing to a T-Rex on this planet.',
    species:        'Dog',
    user:           User.all.sample
  },
  {
    name:           'Kitty',
    price_per_day:   8,
    description:    'Soft kitty, warm kitty, little ball of fur',
    species:        'Cat',
    user:           User.all.sample
  },
  {
    name:           'Dave',
    price_per_day:   46,
    description:    'What a boss',
    species:        'Dog',
    user:           test_user
  },
  {
    name:           'Lucky',
    price_per_day:   50,
    description:    'Good pet. 7/10.',
    species:        'Dog',
    user:           User.all.sample
  },
  {
    name:           'Lionel Ritchie',
    price_per_day:   5,
    description:    "This is a lizard. He's alright.",
    species:        'Lizard',
    user:           User.all.sample
  },
  {
    name:           'Laura',
    price_per_day:   5,
    description:    "Enjoys sunbathing on rocks. Mellow vibes.",
    species:        'Lizard',
    user:           test_user
  },
  {
    name:           'Lola',
    price_per_day:   5,
    description:    "Lovely and lazy",
    species:        'Cat',
    user:           User.all.sample
  },
  {
    name:           'Cristiano Ronaldo',
    price_per_day:   5,
    description:    "Not good at soccer. Such high hopes.",
    species:        'Cat',
    user:           User.all.sample
  },
  {
    name:           'Nemo',
    price_per_day:   5,
    description:    "Looking for my dad.",
    species:        'Fish',
    user:           User.all.sample
  },
  {
    name:           'Helen',
    price_per_day:   5,
    description:    "Enjoys heavy rock music",
    species:        'Fish',
    user:           User.all.sample
  },
  {
    name:           'Stu',
    price_per_day:   5,
    description:    "The wet life",
    species:        'Fish',
    user:           User.all.sample
  },
  {
    name:           'Ferdie',
    price_per_day:   5,
    description:    "The Einstein of Fish",
    species:        'Fish',
    user:           test_user
  },
  {
    name:           'Greg',
    price_per_day:   5,
    description:    "Youtube sensation in Taylor Swift remix",
    species:        'Goat',
    user:           User.all.sample
  },
  {
    name:           'Goodridge',
    price_per_day:   5,
    description:    "The true G.O.A.T",
    species:        'Goat',
    user:           User.all.sample
  },

]
Pet.create!(pets_array)


photos = {
  "Lizard" => ["lizard1.jpeg", "lizard2.jpeg"],
  "Goat" => ["goat1.jpeg", "goat2.jpeg"],
  "Dog" => ["dog1.jpeg", "dog2.jpeg", "dog3.jpeg", "dog4.jpeg"],
  "Cat" => ["cat1.jpeg", "cat2.jpeg", "cat3.jpeg"],
  "Fish" => ["fish1.jpeg", "fish2.jpeg", "fish3.jpeg", "fish4.jpeg"]
}

Pet.all.each do |pet|

  file = File.open('app/assets/images/' + photos[pet.species].sample)
  filename = pet.name + ".jpg"
  pet.photos.attach(io: file, filename: filename, content_type: 'image/jpg')
  # Here we write article.photo.attach(...) because we wrote has_one_attached :photo in app/models article.rb
  pet.location = pet.user.location
  pet.save
end

# Bookings Creation

clifford_bookings = Booking.create!([
  {
    start_date:     Date.new(2019,10,23),
    end_date:       Date.new(2019,10,25),
    pet:            clifford_pet,
    user:           User.all.sample
  },
  {
    start_date:     Date.new(2019,10,1),
    end_date:       Date.new(2019,10,2),
    pet:            clifford_pet,
    user:           User.all.sample
  },
  {
    start_date:     Date.new(2019,11,4),
    end_date:       Date.new(2019,11,5),
    pet:            clifford_pet,
    user:           User.all.sample
  },
  {
    start_date:     Date.new(2019,11,18),
    end_date:       Date.new(2019,11,19),
    pet:            clifford_pet,
    user:           User.all.sample
  }
])

test_user_bookings = Booking.create!([
  {
    start_date:     Date.new(2019,11,10),
    end_date:       Date.new(2019,11,12),
    pet:            Pet.all.sample,
    user:           test_user
  },
  {
    start_date:     Date.new(2019,10,2),
    end_date:       Date.new(2019,10,3),
    pet:            Pet.all.sample,
    user:           test_user
  },
  {
    start_date:     Date.new(2019,9,10),
    end_date:       Date.new(2019,9,12),
    pet:            Pet.all.sample,
    user:           test_user
  },
  {
    start_date:     Date.new(2019,11,23),
    end_date:       Date.new(2019,11,24),
    pet:            Pet.all.sample,
    user:           test_user
  }
])

# Reviews creation

clifford_bookings.each do |booking|
  Review.create!(content: Faker::Movies::HarryPotter.quote, rating: rand(3..5), booking: booking)
end

puts 'Finished!'
