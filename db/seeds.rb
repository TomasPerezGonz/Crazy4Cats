# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

10.times do
    User.create!(
      email: Faker::Internet.email,
      password: "password123",
      password_confirmation: "password123",
      name: Faker::Name.name,
      photo: Faker::Avatar.image
    )
  end
  
  puts "Usuarios creados"

  users = User.all
  
  users.each do |user|
    5.times do
      user.articles.create!(
        title: Faker::Lorem.sentence(word_count: 5),
        description: Faker::Lorem.paragraph(sentence_count: 10)
      )
    end
  end
  
  puts "Artículos creados"

  articles = Article.all
  
  articles.each do |article|
    3.times do
      article.comments.create!(
        content: Faker::Lorem.paragraph(sentence_count: 3),
        user: users.sample,  
        anonymous: [true, false].sample 
      )
    end
  end
  
  puts "Comentarios creados"

  kinds = ["like", "dislike", "not_interested", "neutral"]
  
  articles.each do |article|
    4.times do |i|
      article.reactions.create!(
        user: users[i],  
        kind: kinds[i]
      )
    end
  end
  
  puts "Reacciones para los artículos creadas"

  comments = Comment.all
  
  comments.each do |comment|
    2.times do |i|
      comment.reactions.create!(
        user: users[i],  
        kind: kinds[i],
        article: comment.article
      )
    end
  end
  
  puts "Reacciones de comentarios creadas"
  