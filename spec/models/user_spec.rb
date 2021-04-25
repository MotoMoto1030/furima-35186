require 'rails_helper'
RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できるとき' do
      it '必要な情報が全て存在すれば登録できる' do
        expect(@user).to be_valid
      end
    end

    context '新規登録できないとき' do
      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end

      it '重複したemailが存在する場合登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end

      it 'emailに@が含まれていないと登録ができない' do
        @user.email = 'abcom'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end

      it 'nicknameが空では登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end

      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end

      it 'passwordが5文字以下では登録できない' do
        @user.password = 'a0000'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end

      it 'passwordが半角数字のみの場合は登録できない' do
        @user.password = '000000'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password Include both letters and numbers')
      end

      it 'passwordが半角英字のみの場合は登録できない' do
        @user.password = 'abcdef'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password Include both letters and numbers')
      end

      it 'passwordが全角の場合は登録できない' do
        @user.password = '００００００b'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password Include both letters and numbers')
      end

      it 'パスワードとパスワード(確認用)の値が一致していない場合は登録できない' do
        @user.password = 'ab0001'
        @user.password_confirmation = 'ab0002'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it 'password_confirmationが空では登録できない' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it 'family_nameが空では登録できない' do
        @user.family_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name can't be blank")
      end

      it 'first_nameが空では登録できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end

      it 'family_name_katakanaが空では登録できない' do
        @user.family_name_katakana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name katakana can't be blank")
      end

      it 'first_name_katakanaが空では登録できない' do
        @user.first_name_katakana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name katakana can't be blank")
      end

      it 'birthdayが空では登録できない' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end

      it 'family_nameは全角でなければ登録できない' do
        @user.family_name = 'yamada'
        @user.valid?
        expect(@user.errors.full_messages).to include('Family name Full-width characters')
      end

      it 'first_nameは全角でなければ登録できない' do
        @user.first_name = 'tarou'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name Full-width characters')
      end

      it 'family_name_katakanaは全角でなければ登録できない' do
        @user.family_name_katakana = 'yamada'
        @user.valid?
        expect(@user.errors.full_messages).to include('Family name katakana Full-width katakana characters')
      end

      it 'first_name_katakanaは全角でなければ登録できない' do
        @user.first_name_katakana = 'tarou'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name katakana Full-width katakana characters')
      end

      it 'family_name_katakanaは全角カタカナでなければ登録できない' do
        @user.family_name_katakana = '山田'
        @user.valid?
        expect(@user.errors.full_messages).to include('Family name katakana Full-width katakana characters')
      end

      it 'first_name_katakanaは全角カタカナでなければ登録できない' do
        @user.first_name_katakana = '太郎'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name katakana Full-width katakana characters')
      end
    end
  end
end
