class OrderAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :shipping_area_id, :municipality, :address, :building_name, :phone_number, :user_id, :item_id,
                :token

  with_options presence: true do
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'はハイフンを含め半角数字で入力してください' }
    validates :municipality
    validates :address
    validates :phone_number, format: { with: /\A\d{10,11}\z/, message: 'は数字のみ入力してください' }
    validates :user_id
    validates :item_id
    validates :token
    validates :shipping_area_id, numericality: { other_than: 1, message: 'を選択してください' }
  end

  def save
    order = Order.create(item_id: item_id, user_id: user_id)
    AddressInfo.create(postal_code: postal_code, municipality: municipality, address: address, phone_number: phone_number,
                       shipping_area_id: shipping_area_id, building_name: building_name, order_id: order.id)
  end
end
