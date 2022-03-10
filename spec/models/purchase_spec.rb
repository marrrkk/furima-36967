require 'rails_helper'

RSpec.describe Purchase, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    sleep 1
    @purchase = FactoryBot.build(:purchase, user_id: user.id, item_id: item.id)
  end

  context '内容に問題ない場合' do
    it 'すべての値が正しく入力されていれば保存できる' do
      expect(@purchase).to be_valid
    end
  end

  context '内容に問題がある場合' do
    it 'userが紐付いていないと保存ができない' do
      @purchase.user_id = nil
      @purchase.valid?
      expect(@purchase.errors.full_messages).to include("User can't be blank")
    end

    it 'itemが紐付いていないと保存ができない' do
      @purchase.item_id = nil
      @purchase.valid?
      expect(@purchase.errors.full_messages).to include("User can't be blank")
    end

    it 'post_codeが空では登録できないこと' do
      @purchase.post_code = nil
      @purchase.valid?
      expect(@item.errors.full_messages).to include("Token can't be blank")
    end

    it 'shipping_area_idが空では登録できないこと' do
      @purchase.shipping_area_id = nil
      @purchase.valid?
      expect(@item.errors.full_messages).to include("Token can't be blank")
    end

    it 'municipalitiesが空では登録できないこと' do
      @purchase.municipalities = nil
      @purchase.valid?
      expect(@item.errors.full_messages).to include("Token can't be blank")
    end

    it 'addressが空では登録できないこと' do
      @purchase.address = nil
      @purchase.valid?
      expect(@item.errors.full_messages).to include("Token can't be blank")
    end

    it 'telephone_numberが空では登録できないこと' do
      @purchase.telephone_number = nil
      @purchase.valid?
      expect(@item.errors.full_messages).to include("Token can't be blank")
    end

    it 'tokenが空では登録できないこと' do
      @purchase.token = nil
      @purchase.valid?
      expect(@item.errors.full_messages).to include("Token can't be blank")
    end
  end
end
