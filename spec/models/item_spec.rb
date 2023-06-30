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
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it '商品名が必須である' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it '商品の説明が必須である' do
        @item.description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Description can't be blank")
      end
      it 'カテゴリーに「---」が選択されている場合は出品できない' do
        @item.category_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it '商品の状態に「---」が選択されている場合は出品できない' do
        @item.state_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("State can't be blank")
      end
      it '配送料の負担に「---」が選択されている場合は出品できない' do
        @item.shipcharge_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipcharge can't be blank")
      end
      it '発送元の地域に「---」が選択されている場合は出品できない' do
        @item.prefecture_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank")
      end
      it '発送までの日数に「---」が選択されている場合は出品できない' do
        @item.shipday_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipday can't be blank")
      end
      it '価格の情報が必須である' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it '価格は、¥300より小さい値では保存できない' do
        @item.price = '299'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is out of setting range')
      end
      it '価格は、¥9,999,999より大きい値では保存できない' do
        @item.price = '10000000'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is out of setting range')
      end
      it '価格は半角数値のみ保存できる' do
        @item.price = '５００'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is invalid. Input half-width characters')
      end
      it 'userが紐付いていなければ出品できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('User must exist')
      end
    end
  end
end
