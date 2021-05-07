class Order < ApplicationRecord
  belongs_to :user
  belongs_to :item
  has_one :address_info
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :shipping_area
end
