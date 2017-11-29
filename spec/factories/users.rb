FactoryBot.define do
  factory :user do
    username 'user1'
    sequence :email do |n|
      "person#{n}@example.com"
    end
    password '123123123'
  end
end
