FactoryGirl.define do
  factory :gist do
    snippet 'example code'
    lang 'css'
    description 'example description'
  end
end