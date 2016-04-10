FactoryGirl.define do
  factory :entry do
    name 'Test Repository'
    github_response "{\"test\":\"json\"}"
  end
end
