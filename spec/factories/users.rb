FactoryBot.define do
  factory :user do
    nickname              { 'T' }
    email                 { Faker::Internet.free_email }
    password              { '1a' + Faker::Internet.password(min_length: 6) }
    password_confirmation { password }
    family_name           { '山田' }
    first_name            { '太郎' }
    family_name_katakana  { 'ヤマダ' }
    first_name_katakana   { 'タロウ' }
    birthday              { '1945-08-09' }
  end
end
