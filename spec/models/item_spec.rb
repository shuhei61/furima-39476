require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '出品登録' do
    context '登録できるとき' do
      it '必要な情報を適切に入力して「出品」ボタンを押すと、新規登録ができる' do
        expect(@item).to be_valid
      end
    end

    context '登録できないとき' do
      it '商品画像を1枚つけることが必須である' do
      end
      it '商品名が必須である' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
    end
  end
end
