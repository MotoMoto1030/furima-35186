FactoryBot.define do
  factory :item do
    item_name              { 'オムライスの模型' }
    item_description       { '美味しいオムライスの模型' }
    price                  { 500 }
    item_status_id         { 2 }
    shipping_charge_id     { 2 }
    shipping_area_id       { 2 }
    category_id            { 2 }
    days_to_ship_id        { 2 }
    association            :user

    after(:build) do |item|
      item.image.attach(io: open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
