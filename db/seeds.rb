require 'Faker'

5.times do
  u = User.create!(
  email: Faker::Internet.unique.email,
  password_digest: User.digest(Faker::Name.unique.name),
  first_name: Faker::Name.name,
  last_name: Faker::Name.name,
  address: Faker::Address.street_address,
  age: Faker::Number.between(21,99),
  gender: "male",
  admin: false
  )
  5.times do
    c = u.cars.create!(
    color: Faker::Color.color_name,
    year: Faker::Number.between(2000,2017),
    make: Faker::Vehicle.manufacture,
    model: Faker::StarWars.vehicle,
    km: Faker::Number.between(1000,100000),
    tran: "manual",
    fuel_type: "gas",
    price: Faker::Number.between(50,200),
    plate_num: Faker::Number.number(7)
    )
  end
end
