class BookingSerializer < ActiveModel::Serializer
  attributes :start_date ,:end_date,:created_at ,:updated_at ,:renter_id ,:leaser_id, :tool_id, :price
  has_one :tool
end
