require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @order_address = FactoryBot.build(:order_address, user_id: user.id, item_id: item.id)
  end

  describe '商品購入機能' do
    context '購入できるとき' do
      it '必要な情報が全て存在すれば登録できる' do
        expect(@order_address).to be_valid
      end

      it 'building_nameは空でも保存できること' do
        @order_address.building_name= ''
        expect(@order_address).to be_valid
        sleep 0.1
      end
    end

    context '内容に問題がある場合' do
      it 'postal_codeが空だと保存できないこと' do
        @order_address.postal_code = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Postal code can't be blank")
      end

      it 'postal_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
        @order_address.postal_code = '9999999'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Postal code Input correctly")
        sleep 0.1
      end

      it 'municipalityが空だと保存できないこと' do
        @order_address.municipality = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Municipality can't be blank")
        sleep 0.1
      end

      it 'addressが空だと保存できないこと' do
        @order_address.address = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Address can't be blank")
        sleep 0.1
      end

      it 'phone_numberが空だと保存できないこと' do
        @order_address.phone_number = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number can't be blank")
        sleep 0.1
      end

      it 'phone_numberが全角数字だと保存できないこと' do
        @order_address.phone_number = '０９０５５５５１１１０'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number Input only number")
        sleep 0.1
      end

      it 'shipping_area_idが1だと保存できないこと' do
        @order_address.shipping_area_id = '1'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Shipping area Select")
        sleep 0.1
      end
    end
  end
end

