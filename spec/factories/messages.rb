FactoryGirl.define do
  factory :message do
    body "My message"
    receiver { build_stubbed(:user) }
  end
end