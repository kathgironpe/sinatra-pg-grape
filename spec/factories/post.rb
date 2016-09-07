FactoryGirl.define do
  factory :post do
    title FFaker::Movie.title
    body FFaker::LoremFR.paragraph
  end
end
