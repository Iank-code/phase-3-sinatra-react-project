require 'faker'
puts "🌱 Seeding spices..."

6.times do
  Category.create!(
    category: Faker::Name.name
  )
end

# Seed your database here
10.times do
  Todo.create!(
    name: Faker::Name.name,
    description: Faker::Lorem.sentence,
    category_id: Category.pluck(:id).sample,
  )
#   tasks << task
end

puts "✅ Done seeding!"
