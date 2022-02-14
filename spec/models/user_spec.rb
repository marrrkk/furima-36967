require 'rails_helper'

RSpec.describe User, type: :model do
  describe "ユーザー新規登録" do
    it "nicknameが空だと登録できない" do
      user = User.new(nickname: "", family_name: "金子", first_name: "真", family_name_kana: "カネコ", first_name_kana: "マ", birth_day: "0127" )
      user.valid?
      expect(user.errors.full_messages).to include("Nickname can't be blank")
    end
    it "family_nameが空では登録できない" do
      user = User.new(nickname: "マーク", family_name: "", first_name: "真", family_name_kana: "カネコ", first_name_kana: "マ", birth_day: "0127" )
      user.valid?
      expect(user.errors.full_messages).to include("Family name can't be blank")
    end
    it "first_nameが空では登録できない" do
      user = User.new(nickname: "マーク", family_name: "金子", first_name: "", family_name_kana: "カネコ", first_name_kana: "マ", birth_day: "0127" )
      user.valid?
      expect(user.errors.full_messages).to include("First name can't be blank")
    end
    it "family_name_kanaが空では登録できない" do
      user = User.new(nickname: "マーク", family_name: "金子", first_name: "真", family_name_kana: "", first_name_kana: "マ", birth_day: "0127" )
      user.valid?
      expect(user.errors.full_messages).to include("Family name kana can't be blank")
    end
    it "first_name_kanaが空では登録できない" do
      user = User.new(nickname: "マーク", family_name: "金子", first_name: "真", family_name_kana: "カネコ", first_name_kana: "", birth_day: "0127" )
      user.valid?
      expect(user.errors.full_messages).to include("First name kana can't be blank")
    end
    it "birth_dayが空では登録できない" do
      user = User.new(nickname: "マーク", family_name: "金子", first_name: "真", family_name_kana: "カネコ", first_name_kana: "マ", birth_day: "" )
      user.valid?
      expect(user.errors.full_messages).to include("Birth day can't be blank")
    end
    it "passwordは半角英数でないと登録できない" do
      user = User.new(password: "000000")
      user.valid?
      expect(user.errors.full_messages).to include("Encrypted password は半角英数を両方含む必要があります")
    end
    it "family_nameは全角でないと登録できない" do
      user =  User.new(family_name: "ｱｲｳｴｵ")
      user.valid?
      expect(user.errors.full_messages).to include("Family name is invalid")
    end
    it "first_nameは全角でないと登録できない" do
      user = User.new(first_name: "ｱｲｳｴｵ")
      user.valid?
      expect(user.errors.full_messages).to include("First name is invalid")
    end
    it "family_name_kanaは全角カタカナでないと登録できない" do
      user = User.new(family_name_kana: "あいうえお")
      user.valid?
      expect(user.errors.full_messages).to include("Family name kana is invalid")
    end
    it "first_name_kanaは全角カタカナでないと登録できない" do
      user = User.new(first_name_kana: "あいうえお")
      user.valid?
      expect(user.errors.full_messages).to include("First name kana is invalid")
    end
  end
end