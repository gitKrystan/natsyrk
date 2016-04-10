FactoryGirl.define do
  factory :entry do
    name 'natsyrk-test-with-entry'
    github_response '{\"test\":\"json\"}'

    factory :entry_with_entry_md do
      name 'natsyrk-test-with-entry'
    end

    factory :entry_with_readme do
      name 'natsyrk-test-with-readme'
    end

    factory :entry_without_entry_md_or_readme do
      name 'natsyrk-test-blank'
    end
  end
end
