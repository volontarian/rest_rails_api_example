def r_str
  SecureRandom.hex(3)
end

FactoryGirl.define do
  factory :feed do
    sequence(:title) { |n| "feed#{n}#{r_str}" }
    sequence(:url) { |n| "url#{n}#{r_str}" }
  end
  
  factory :article do
    sequence(:title) { |n| "article#{n}#{r_str}" }
    sequence(:description) { |n| "description#{n}#{r_str}" }
    published_at { Time.now }
  end
  
  factory :category do
    sequence(:title) { |n| "category#{n}#{r_str}" }
  end
end