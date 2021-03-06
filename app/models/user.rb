class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items
  has_many :orders
  has_many :comments

  with_options presence: true do
    validates :nickname
    validates :birthday
    with_options format: { with: /\A[ぁ-んァ-ヶー-龥々ー]+\z/, message: 'を全角で入力してください' } do
      validates :family_name
      validates :first_name
    end
    with_options format: { with: /\A[\p{katakana} ー－&&[^ -~｡-ﾟ]]+\z/, message: 'を全角で入力してください' } do
      validates :family_name_katakana
      validates :first_name_katakana
    end
  end
  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX, message: 'のなかに英数字を含ませてください'
end
