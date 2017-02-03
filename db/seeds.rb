require 'Faker'
User.create!(
email: "zsy@199.com",
password_digest: User.digest('Tt123456'),
first_name: 'test',
last_name: 'test_last'
)
User.create!(
email: "admin@boro.one",
password_digest: User.digest('Password1'),
first_name: 'Boro',
last_name: 'Admin'
)
renter = User.create!(
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
  2.times do
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
    2.times do
      b = c.bookings.create!(
      start_date: "null",
      end_date: "null",
      leaser_id: u.id,
      renter_id: renter.id
      )
      s = Sale.create!(
      price: 25,
      deposit: 20,
      final_payment: 110,
      insurance_fee: 20,
      number_nights: 4,
      taxes: 10,
      total_price: 130,
      booking_id: b.id,
      leaser_id: u.id,
      renter_id: renter.id
      )
    end
  end
end
