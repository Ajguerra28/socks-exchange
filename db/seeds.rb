puts "Creating the Three Musketeers..."
Booking.destroy_all
Sock.destroy_all
User.destroy_all

antonio = User.create(name: 'António Guerra', email: 'antonioguerrained@gmail.com', password: '123123', location: 'Porto', date_of_birth: Faker::Date.birthday(min_age: 24, max_age: 25), gender: 'male', phone_number: '+351927624961')
david = User.create(name: 'David Luis', email: 'davidluis2020@gmail.com', password: '123123', location: 'Lisbon', date_of_birth: Faker::Date.birthday(min_age: 26, max_age: 27), gender: 'male', phone_number: '+351912345678')
mariana = User.create(name: 'Mariana Kobayashi', email: 'marianadanifk@gmail.com', password: '123123', location: 'Japan', date_of_birth: Faker::Date.birthday(min_age: 23, max_age: 25), gender: 'female', phone_number: '+351937826634')

antonio.avatar.attach(
  io: File.open(Rails.root.join("app/assets/images/ava6.jpg")),
  filename: 'antonio.jpg'
)

david.avatar.attach(
  io: File.open(Rails.root.join("app/assets/images/ava2.jpg")),
  filename: 'david.jpg'
)

mariana.avatar.attach(
  io: File.open(Rails.root.join("app/assets/images/ava5.jpg")),
  filename: 'mariana.jpg'
)

puts "Hello António, David and Mariana!"
puts "..."
puts "Creating some more users..."

# location = []
# counter = 0

10.times do
  user = User.create!(
    name: Faker::Name.name,
    email: Faker::Internet.safe_email,
    password: Faker::Blockchain::Bitcoin.address.first(10),
    location: Faker::Address.full_address,
    date_of_birth: Faker::Date.birthday(min_age: 18, max_age: 65),
    gender: %w[male female].sample,
    phone_number: Faker::PhoneNumber.phone_number_with_country_code
    # location: location[counter]
  )
  user.avatar.attach(
    io: File.open(Rails.root.join("app/assets/images/ava#{rand(1..11)}.jpg")),
    filename: 'sock.jpg'
  )
  # counter += 1
end

puts "All users have been created. Thanks!"
# ------------------- CHANGE DATABASE ------------------- #
puts "Creating some amazin socks..."
users = User.all

10.times do
  sock = Sock.create!(
    type_of_socks: ['Knee high socks', 'Calf socks', 'Ankle socks'].sample,
    price: %w[3.99 4.99 9.99 14.99 19.99].sample,
    size: %w[36 37 38 39 40 41 42 43 44].sample,
    color: Faker::Color.color_name,
    description: Faker::Lorem.paragraph(sentence_count: 2, supplemental: false, random_sentences_to_add: 4),
    quantity: %w[1 2 3 4 5 6 7].sample,
    owner: users.sample
  )
  sock.photo.attach(
    io: File.open(Rails.root.join("app/assets/images/sock#{rand(1..11)}.jpg")),
    filename: 'sock.jpg'
  )
end

puts "All the dirty socks have been created. Thanks!"
