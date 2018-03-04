# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all

u1 = User.create name:'a1', email: 'a1@mail.com', password: 'chicken', relationship_status: 1
u2 = User.create name:'a2', email: 'a2@mail.com', password: 'chicken', relationship_status: 1
u3 = User.create name:'s', email: 's@mail.com', password: 'chicken', relationship_status: 0

puts "Created #{ User.all.length } users."

Card.destroy_all

c1 = Card.create sentiment: 0, incident: "This happened", feeling: "okay", expectation: "That it was expected", importance: 6, user_id: u1
c2 = Card.create sentiment: 1, incident: "This didn't happened", feeling: "meh", expectation: "That it should happen differently", importance: 8, user_id: u1
c3 = Card.create sentiment: 0, incident: "This happened", feeling: "great", expectation: "That it was expected", importance: 5, user_id: u2
c4 = Card.create sentiment: 1, incident: "This happened", feeling: "awesome", expectation: "That it was expected", importance: 3, user_id: u2
c5 = Card.create sentiment: 2, incident: "This didn't happened", feeling: "I don't know", expectation: "I don't know", importance: 7, user_id: u3

puts "Created #{ Card.all.length } cards."

Sprint.destroy_all

s1 = Sprint.create status: true, start: "2018-02-01", end: "2018-02-14"
s2 = Sprint.create status: false, start: "2018-02-15", end: "2018-02-28"

puts "Created #{ Sprint.all.length } sprints."

Task.destroy_all

t1 = Task.create todo: "eat", user_id: u1, card_id: c1
t2 = Task.create todo: "sleep", user_id: u1, card_id: c2
t3 = Task.create todo: "drink", user_id: u2, card_id: c1
t4 = Task.create todo: "code", user_id: u2, card_id: c3

puts "Created #{ Task.all.length } tasks."

Comment.destroy_all

m1 = Comment.create title: "hi", description: "this is a comment", user_id: u1, card_id: c1
m2 = Comment.create title: "bye", description: "this is not a comment", user_id: u1, card_id: c3
m3 = Comment.create title: "oops", description: "this is an accidental comment", user_id: u2, card_id: c3

puts "Created #{ Comment.all.length } tasks."
