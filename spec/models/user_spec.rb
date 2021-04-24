require 'rails_helper'
RSpec.describe User, type: :model do
  describe 'ユーザー新規登録' do
    it '必要な情報が全て存在すれば登録できる' do
      user = User.new(nickname: 'T', email: 'a@com', password: 'ab0001', password_confirmation: 'ab0001', family_name: '山田',
                      first_name: '太郎', family_name_katakana: 'ヤマダ', first_name_katakana: 'タロウ', birthday: '1945-08-09')
    end

    it 'emailが空では登録できない' do
      user = User.new(nickname: 'T', email: '', password: 'ab0001', password_confirmation: 'ab0001', family_name: '山田',
                      first_name: '太郎', family_name_katakana: 'ヤマダ', first_name_katakana: 'タロウ', birthday: '1945-08-09')
      user.valid?
      expect(user.errors.full_messages).to include("Email can't be blank")
    end

    it 'nicknameが空では登録できない' do
      user = User.new(nickname: '', email: 'a@com', password: 'ab0001', password_confirmation: 'ab0001', family_name: '山田',
                      first_name: '太郎', family_name_katakana: 'ヤマダ', first_name_katakana: 'タロウ', birthday: '1945-08-09')
      user.valid?
      expect(user.errors.full_messages).to include("Nickname can't be blank")
    end

    it 'passwordが空では登録できない' do
      user = User.new(nickname: 'T', email: 'a@com', password: '', password_confirmation: 'ab0001', family_name: '山田',
                      first_name: '太郎', family_name_katakana: 'ヤマダ', first_name_katakana: 'タロウ', birthday: '1945-08-09')
      user.valid?
      expect(user.errors.full_messages).to include("Password can't be blank")
    end

    it 'password_confirmationが空では登録できない' do
    end

    it 'family_nameが空では登録できない' do
      user = User.new(nickname: 'T', email: 'a@com', password: 'ab0001', password_confirmation: 'ab0001', family_name: '',
                      first_name: '太郎', family_name_katakana: 'ヤマダ', first_name_katakana: 'タロウ', birthday: '1945-08-09')
      user.valid?
      expect(user.errors.full_messages).to include("Family name can't be blank")
    end

    it 'first_nameが空では登録できない' do
      user = User.new(nickname: 'T', email: 'a@com', password: 'ab0001', password_confirmation: 'ab0001', family_name: '山田',
                      first_name: '', family_name_katakana: 'ヤマダ', first_name_katakana: 'タロウ', birthday: '1945-08-09')
      user.valid?
      expect(user.errors.full_messages).to include("First name can't be blank")
    end

    it 'family_name_katakanaが空では登録できない' do
      user = User.new(nickname: 'T', email: 'a@com', password: 'ab0001', password_confirmation: 'ab0001', family_name: '山田',
                      first_name: '太郎', family_name_katakana: '', first_name_katakana: 'タロウ', birthday: '1945-08-09')
      user.valid?
      expect(user.errors.full_messages).to include("Family name katakana can't be blank")
    end

    it 'first_name_katakanaが空では登録できない' do
      user = User.new(nickname: 'T', email: 'a@com', password: 'ab0001', password_confirmation: 'ab0001', family_name: '山田',
                      first_name: '太郎', family_name_katakana: 'ヤマダ', first_name_katakana: '', birthday: '1945-08-09')
      user.valid?
      expect(user.errors.full_messages).to include("First name katakana can't be blank")
    end

    it 'birthdayが空では登録できない' do
      user = User.new(nickname: 'T', email: 'a@com', password: 'ab0001', password_confirmation: 'ab0001', family_name: '山田',
                      first_name: '太郎', family_name_katakana: 'ヤマダ', first_name_katakana: 'タロウ', birthday: '')
      user.valid?
      expect(user.errors.full_messages).to include("Birthday can't be blank")
    end
  end
end
