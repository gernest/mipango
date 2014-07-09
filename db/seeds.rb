require 'faker'

user=User.first
20.times do
    user.plans.create(title: Faker::Name.title)
end

plan=Plan.all
plan.each do |pln|
    5.times do
        user.plans.find_by_id(pln.id).plots.create(title: Faker::Name.title, body: Faker::Lorem.paragraphs(5))
    end
end
