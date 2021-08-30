puts "Creating some users for testing..."
User.destroy_all

10.times do
  User.create(
    name: Faker::Name.name,
    location: Faker::Address.full_address,
    email: Faker::Internet.safe_email,
    date_of_birth: Faker::Date.birthday(min_age: 18, max_age: 65),
    password: Faker::Blockchain::Bitcoin.address.first(10),
    gender: %w[male, female].sample,
    phone_number: Faker::PhoneNumber.phone_number_with_country_code
  )

  puts "All users have been created. Thanks!"
