FactoryGirl.define do
  factory :article do
    title "string"
    author "string"
    description "string"
    author_link "string"
    article_link "string"

    after(:build) { |article| article.class.skip_callback(:create, :before, :scrub_fields_of_new_lines) }
  end
end