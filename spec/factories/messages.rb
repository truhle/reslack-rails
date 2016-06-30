FactoryGirl.define do
  factory :message do
    beginning false
    content "MyText"
    sender "MyString"
    timestamp 1
    user nil
    channel nil
  end
end
