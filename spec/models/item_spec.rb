require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品機能' do
    context '出品できるとき' do
      it '必要な情報が全て存在すれば登録できる' do
        expect(@item).to be_valid
      end
    end

    context '出品できない時' do
      it 'imageが空では出品できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end

      it 'item_nameが空では出品できない' do
        @item.item_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item name can't be blank")
      end

      it 'item_descriptionが空では出品できない' do
        @item.item_description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item description can't be blank")
      end

      it 'priceが空では出品できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end

      it 'priceが全角数字だと出品できない' do
        @item.price = '５００'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price Half-width number')
      end

      it 'priceが全角文字だと出品できない' do
        @item.price = 'あいうえお'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price Half-width number')
      end

      it 'priceが半角英数混合だと出品できない' do
        @item.price = '500er'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price Half-width number')
      end

      it 'priceが半角英語だと出品できない' do
        @item.price = 'abcdefg'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price Half-width number')
      end

      it 'priceが下限以下の数字であれば出品できない' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include('Price Out of setting range')
      end

      it 'priceが上限以上の数字であれば出品できない' do
        @item.price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include('Price Out of setting range')
      end

      it 'item_statusが空では出品できない' do
        @item.item_status_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include('Item status Select')
      end

      it 'item_status_idが1では出品できない' do
        @item.item_status_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Item status Select')
      end

      it 'shipping_chrgeが空では出品できない' do
        @item.shipping_charge_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include('Shipping charge Select')
      end

      it 'shipping_chrge_idが1では出品できない' do
        @item.shipping_charge_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Shipping charge Select')
      end

      it 'shipping_areaが空では出品できない' do
        @item.shipping_area_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include('Shipping area Select')
      end

      it 'shipping_area_idが1では出品できない' do
        @item.shipping_area_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Shipping area Select')
      end

      it 'categoryが空では出品できない' do
        @item.category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include('Category Select')
      end

      it 'category_idが1では出品できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Category Select')
      end

      it 'days_to_shipが空では出品できない' do
        @item.days_to_ship_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include('Days to ship Select')
      end

      it 'days_to_ship_idが1では出品できない' do
        @item.days_to_ship_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Days to ship Select')
      end
    end
  end
end
