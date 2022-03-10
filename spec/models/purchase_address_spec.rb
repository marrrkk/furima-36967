require 'rails_helper'

RSpec.describe PurchaseAddress, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    sleep 1
    @purchase_address = FactoryBot.build(:purchase_address, user_id: user.id, item_id: item.id)
  end

  describe '商品購入' do
    context '商品購入できる時' do
      it 'すべての値が正しく入力されていれば購入できる' do
        expect(@purchase_address).to be_valid
      end
      it 'buildingは空でも購入できる' do
        @purchase_address.building = ''
        expect(@purchase_address).to be_valid
      end
    end

    context '商品購入できない時' do
      it 'post_codeが空だと購入できない' do
        @purchase_address.post_code = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Post code can't be blank")
      end
      it 'post_codeが半角のハイフンを含んだ正しい形式でないと購入できない' do
        @purchase_address.post_code = '1234567'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include('Post code is invalid. Include hyphen(-)')
      end
      it 'shipping_area_idを選択していないと購入できない' do
        @purchase_address.shipping_area_id = 1
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Shipping area can't be blank")
      end
      it 'municipalitiesが空だと購入できない' do
        @purchase_address.municipalities = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Municipalities can't be blank")
      end
      it 'addressが空だと購入できない' do
        @purchase_address.address = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Address can't be blank")
      end
      it 'telephone_numberが空だと購入できない' do
        @purchase_address.telephone_number = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Telephone number can't be blank")
      end
      it 'telephone_numberが9桁以下では購入できない' do
        @purchase_address.telephone_number = '12345678'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Telephone number can't be blank")
      end
      it 'telephone_numberが12桁以上では購入できない' do
        @purchase_address.telephone_number = '123456789012'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Telephone number can't be blank")
      end
      it 'telephone_numberに半角数字以外が含まれている場合は購入できない' do
        @purchase_address.telephone_number = '１２３'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Telephone number can't be blank")
      end
      it 'tokenが空だと購入できない' do
        @purchase_address.token = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Token can't be blank")
      end
      it 'userが紐付いていなければ購入できない' do
        @purchase_address.user_id = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("User can't be blank")
      end
      it 'itemが紐付いていなければ購入できない' do
        @purchase_address.item_id = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end
