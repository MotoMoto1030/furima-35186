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
        expect(@user.errors.full_messages).to include('Eメールを入力してください')
      end

      it '重複したemailが存在する場合登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Eメールはすでに存在します')
      end

      it 'emailに@が含まれていないと登録ができない' do
        @user.email = 'abcom'
        @user.valid?
        expect(@user.errors.full_messages).to include('Eメールは不正な値です')
      end

      it 'nicknameが空では登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('ニックネームを入力してください')
      end

      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードを入力してください')
      end

      it 'passwordが5文字以下では登録できない' do
        @user.password = 'a0000'
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードは6文字以上で入力してください')
      end

      it 'passwordが半角数字のみの場合は登録できない' do
        @user.password = '000000'
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードのなかに英数字を含ませてください')
      end

      it 'passwordが半角英字のみの場合は登録できない' do
        @user.password = 'abcdef'
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードのなかに英数字を含ませてください')
      end

      it 'passwordが全角の場合は登録できない' do
        @user.password = '００００００b'
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードのなかに英数字を含ませてください')
      end

      it 'パスワードとパスワード(確認用)の値が一致していない場合は登録できない' do
        @user.password = 'ab0001'
        @user.password_confirmation = 'ab0002'
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワード（確認用）とパスワードの入力が一致しません')
      end

      it 'password_confirmationが空では登録できない' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワード（確認用）とパスワードの入力が一致しません')
      end

      it 'family_nameが空では登録できない' do
        @user.family_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('苗字を入力してください')
      end

      it 'first_nameが空では登録できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('お名前を入力してください')
      end

      it 'family_name_katakanaが空では登録できない' do
        @user.family_name_katakana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('カタカナで苗字を入力してください')
      end

      it 'first_name_katakanaが空では登録できない' do
        @user.first_name_katakana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('カタカナでお名前を入力してください')
      end

      it 'birthdayが空では登録できない' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('誕生日を入力してください')
      end

      it 'family_nameは全角でなければ登録できない' do
        @user.family_name = 'yamada'
        @user.valid?
        expect(@user.errors.full_messages).to include('苗字を全角で入力してください')
      end

      it 'first_nameは全角でなければ登録できない' do
        @user.first_name = 'tarou'
        @user.valid?
        expect(@user.errors.full_messages).to include('お名前を全角で入力してください')
      end

      it 'family_name_katakanaは全角でなければ登録できない' do
        @user.family_name_katakana = 'yamada'
        @user.valid?
        expect(@user.errors.full_messages).to include('カタカナで苗字を全角で入力してください')
      end

      it 'first_name_katakanaは全角でなければ登録できない' do
        @user.first_name_katakana = 'tarou'
        @user.valid?
        expect(@user.errors.full_messages).to include('カタカナでお名前を全角で入力してください')
      end

      it 'family_name_katakanaは全角カタカナでなければ登録できない' do
        @user.family_name_katakana = '山田'
        @user.valid?
        expect(@user.errors.full_messages).to include('カタカナで苗字を全角で入力してください')
      end

      it 'first_name_katakanaは全角カタカナでなければ登録できない' do
        @user.first_name_katakana = '太郎'
        @user.valid?
        expect(@user.errors.full_messages).to include('カタカナでお名前を全角で入力してください')
      end
    end
  end
end
