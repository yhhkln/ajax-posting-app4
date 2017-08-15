# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# User.create!( :email => "admin@example.org", :password => "111111", :role => "admin")
Category.create!( :name => "ruby")
Category.create!( :name => "js")
Category.create!( :name => "php")
Category.create!( :name => "java")
Category.create!( :name => "python")
