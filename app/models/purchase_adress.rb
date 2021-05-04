class PurchaseAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture, :municipality, :address, :building_name, :phone_number, :user_id, :item_id

  with_options presence: true do
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "Input correctly"}
    validates :municipality
    validates :address
    validates :phone_number, format: {with: /\A\d{10,11}\z/, message: "Input only number"}
    validates :user_id
    validates :item_id
    validates :prefecture, numericality: {other_than: 0, message: "Select"}
  end
  validates :building_name
end