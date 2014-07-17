FactoryGirl.define do
  factory :user do
    email { Faker::Internet.email }
    password { Faker::Internet.password }
  end

  factory :plan do
    title { Faker::Name.title }
    user
  end

  factory :note do
    title
    body
    user
    plan
    plot
  end

  factory :plot do
    title
    body
    plan
    plots { [FactoryGirl.create(:plot)] }
  end
end