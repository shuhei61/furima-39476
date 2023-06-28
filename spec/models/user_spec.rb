require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できるとき' do
      it '必要な情報を適切に入力して「会員登録」ボタンを押すと、新規登録ができる' do
        expect(@user).to be_valid
      end
    end

    context '新規登録ができない' do
      it 'ニックネームが必須であること' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it 'メールアドレスが必須であること' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it 'メールアドレスが一意性であること' do
        @user.save
        new_user = FactoryBot.build(:user)
        new_user.email = @user.email
        new_user.valid?
        expect(new_user.errors.full_messages).to include('Email has already been taken')
      end
      it 'メールアドレスは、@を含む必要があること' do
        @user.email = 'mail.com'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end
      it 'パスワードが必須であること' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'パスワードは、6文字以上での入力が必須であること' do
        @user.password = 'one11'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it 'パスワードは、半角英数字混合での入力が必須であること' do
        @user.password = '111111'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid. Include both letters and numbers')
      end
      it 'パスワードとパスワード（確認）は、値の一致が必須であること' do
        @user.password = 'one111'
        @user.password_confirmation = 'one112'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'お名前(全角)は、名字が必須であること' do
        @user.lastname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Lastname can't be blank")
      end
      it 'お名前(全角)は、名前が必須であること' do
        @user.firstname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Firstname can't be blank")
      end
      it 'お名前(全角)は、全角（漢字・ひらがな・カタカナ）での入力が必須であること' do
        @user.lastname = '山田'
        @user.firstname = 'ﾀﾛｳ'
        @user.valid?
        expect(@user.errors.full_messages).to include('Firstname is invalid. Input full-width characters.')
      end
      it 'お名前カナ(全角)は、名字が必須であること' do
        @user.lastname_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Lastname kana can't be blank")
      end
      it 'お名前カナ(全角)は、名前が必須であること' do
        @user.firstname_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Firstname kana can't be blank")
      end
      it 'お名前カナ(全角)は、全角（カタカナ）での入力が必須であること' do
        @user.lastname = 'ヤマダ'
        @user.firstname = 'ﾀﾛｳ'
        @user.valid?
        expect(@user.errors.full_messages).to include('Firstname is invalid. Input full-width characters.')
      end
      it '生年月日が必須であること' do
        @user.birth_date = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birth date can't be blank")
      end
    end
  end
end
