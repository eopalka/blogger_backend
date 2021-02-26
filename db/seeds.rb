# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

author_1 = Author.create(name: "Elisa")
author_2 = Author.create(name: "Javier")

Blog.create([
  { title: "Blog Title", content: "This is a blog", author: author_1},
  { title: "Blog Title 2", content: "This is a blog 2", author: author_2},
  { title: "Blog Title 3", content: "This is a blog 3", author: author_2}
])

