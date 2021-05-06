FactoryBot.define do
  factory :order_address do
    postal_code       { '999-1030' }
    municipality      { '石川町' }
    address           { 'ガ96番地' }
    building_name     { '柳ビル103号室' }
    phone_number      { '08051512000' }
    shipping_area_id  { 5 }
  end
end
