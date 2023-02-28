require 'faker'
puts "🌱 Seeding spices..."

# 2.times do
#   Category.create!(
#     category: "Cleaning"
#   )
# end

Category.create(
  category: "Cleaning"
)
Category.create(
  category: "Training"
)

# Seed your database here
# 5.times do
  # Todo.create!(
  #   name: Faker::Name.name,
  #   description: Faker::Lorem.sentence,
  #   category_id: Category.pluck(:id).sample,
  # )
#   tasks << task
# end

Todo.create(
  name: "Clean the house",
  description: "Clean the house including your room and take out the trash",
  category_id: Category.pluck(:id).sample,
)
Todo.create(
  name: "Practice",
  description: "Practice football for 2hours",
  category_id: Category.pluck(:id).sample,
)
Todo.create(
  name: "Practice",
  description: "Practice Baseball for 2hours",
  category_id: Category.pluck(:id).sample,
)

puts "✅ Done seeding!"
