FactoryBot.define do
  factory :user do
    nickname { 'furima' }
    email { Faker::Internet.free_email }
    password { 'aaa111' }
    password_confirmation { password }
    first_name { '太郎' }
    family_name { '田中' }
    first_name_kana { 'タロウ' }
    family_name_kana { 'タナカ' }
    birth_day { Faker::Date.birthday(min_age: 5, max_age: 90) }
  end
end
