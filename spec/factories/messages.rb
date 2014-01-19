FactoryGirl.define do
  factory :message do
    body "My Message"
    receiver { build_stubbed(:user) } #speed up test suite - builds mock objects or mock receivers for testing
  end
end
