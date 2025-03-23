FactoryBot.define do
  factory :message do
    content { "MyText" }
    sender_name { "MyString" }
    room { nil }
  end
end
