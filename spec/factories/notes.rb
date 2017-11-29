FactoryBot.define do
  factory :note do
    association :user
    title 'Note 1'
    body 'This is note 1'
  end
end
