require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @order_address = FactoryBot.build(:order_address, user_id: user.id, item_id: item.id)
  end

  context '内容に問題ない場合' do
    it 'すべての値が正しく入力されていれば保存できる' do
      expect(@order_address).to be_valid
    end
    it 'building_nameは空でも保存できる' do
      @order_address.building_name = ''
      expect(@order_address).to be_valid
    end
  end

  context '内容に問題がある場合' do
    it '郵便番号がないと登録できない' do
      @order_address.post_code = ''
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Post code can't be blank")
    end
    it '郵便番号は"-"がないと登録できない' do
      @order_address.post_code = '1234567'
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include('Post code is invalid. Enter it as follows (e.g. 123-4567)')
    end
    it '郵便番号は全角では登録できない' do
      @order_address.post_code = '１２３-４５６７'
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include('Post code is invalid. Enter it as follows (e.g. 123-4567)')
    end
    it '都道府県は"---"のままでは登録できない' do
      @order_address.prefecture_id = '1'
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Prefecture can't be blank")
    end
    it '市区町村がないと登録できない' do
      @order_address.municipalities = ''
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Municipalities can't be blank")
    end
    it '番地がないと登録できない' do
      @order_address.house_number = ''
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("House number can't be blank")
    end
    it '電話番号がないと登録できない' do
      @order_address.phone_number = ''
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Phone number can't be blank")
    end
    it '電話番号は、9文字以下では登録できない' do
      @order_address.phone_number = '123456789'
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include('Phone number is too short')
    end
    it '電話番号は、半角数値以外では登録できない' do
      @order_address.phone_number = '０９０１２３４５６７８'
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include('Phone number is invalid. Input only number')
    end
    it 'tokenがなければ登録できない' do
      @order_address.token = ''
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Token can't be blank")
    end
    it 'userが結びついてなければ登録できない' do
      @order_address.user_id = ''
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("User can't be blank")
    end
    it 'itemが結びついてなければ登録できない' do
      @order_address.item_id = ''
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Item can't be blank")
    end
  end
end
