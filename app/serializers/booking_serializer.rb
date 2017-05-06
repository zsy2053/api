class BookingSerializer < ActiveModel::Serializer
  attributes :start_date ,:end_date ,:car_id ,:created_at ,:updated_at ,:renter_id ,:leaser_id  
  has_one :car
end
