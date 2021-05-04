class PurchaseAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture, :municipality, :address, :building_name, :phone_number, :user_id, :item_id
end