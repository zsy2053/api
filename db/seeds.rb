require 'Faker'

@darren_password = User.digest("Tt123456")
@password = User.digest("Password1")
@user_id = [2,3,4,5]
@renter_email = Faker::Internet.unique.email

def get_renter_id(l,r)
  if l == r
    return r+1
  else
    return r
  end
end
unless User.find_by( email: "zsy@199.com" )
  User.create!(
    email: "zsy@199.com",
    password: @darren_password,
    first_name: 'test',
    last_name: 'test_last',
    image: '',
    address: '155 Yorkville Ave'
  )
end
unless User.find_by( email: "admin@boro.one" )
  User.create!(
    email: "admin@boro.one",
    password: @password,
    first_name: 'Boro',
    last_name: 'Admin',
    image: '',
    address: '155 Yorkville Ave'
  )
end
unless User.find_by( email: @renter_email )
  renter = User.create!(
    email: @renter_email,
    password: @password,
    first_name: Faker::Name.name,
    last_name: Faker::Name.name,
    address: Faker::Address.street_address,
    age: Faker::Number.between(21,99),
    gender: "male",
    admin: false,
    image: ''
  )
end
5.times do
  @temp_email = Faker::Internet.unique.email
  unless User.find_by( email: @temp_email )
    u = User.create!(
      email: @temp_email,
      password: @password,
      # password_confirmation: @password,
      first_name: Faker::Name.name,
      last_name: Faker::Name.name,
      address: Faker::Address.street_address,
      age: Faker::Number.between(21,99),
      gender: "male",
      admin: false,
      image: ''
    )
    5.times do
      @weekday_price = Faker::Number.between(50,90)
      @weekend_price = @weekday_price * 1.13
      c = u.cars.create!(
        color: Faker::Color.color_name,
        year: Faker::Number.between(2000,2017),
        make: "BMW",
        model: Faker::StarWars.vehicle,
        km: Faker::Number.between(1000,100000),
        tran: "manual",
        fuel_type: "gas",
        weekend_price: @weekend_price,
        weekday_price: @weekday_price,
        plate_num: Faker::Number.number(7)
      )
      3.times do
        c.car_photos.create!(
          image: File.new("./public/car.jpg")
        )
      end
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
          renter_id: get_renter_id(u.id, @user_id.sample)
        )
      end
    end
  end
end
