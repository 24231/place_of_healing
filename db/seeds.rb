user = User.order(:created_at).take(6)
50.times do
  content = Faker::Lorem.sentence(word_count: 5)
  place   = Faker::Lorem.sentence(word_count: 5)
  user.each { |user| user.posts.create!(content: content, place: place) }
end