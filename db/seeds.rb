# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all

u1 = User.create name:'a1', email: 'a1@mail.com', password: 'chicken', relationship_status: 1, workspace_id: w1
u2 = User.create name:'a2', email: 'a2@mail.com', password: 'chicken', relationship_status: 1, workspace_id: w1
u3 = User.create name:'s', email: 's@mail.com', password: 'chicken', relationship_status: 0, workspace_id: w2

puts "Created #{ User.all.length } users."

Card.destroy_all

c1 = Card.create sentiment: 0, incident: "This happened", feeling: "okay", expectation: "That it was expected", importance: 6, user_id: u1, sprint_id: s1, shared: true, resolved: true
c2 = Card.create sentiment: 1, incident: "This didn't happened", feeling: "meh", expectation: "That it should happen differently", importance: 8, user_id: u1, sprint_id: s1, shared: true, resolved: false
c3 = Card.create sentiment: 0, incident: "This happened", feeling: "great", expectation: "That it was expected", importance: 5, user_id: u2, sprint_id: s1, shared: true, resolved: false
c4 = Card.create sentiment: 1, incident: "This happened", feeling: "awesome", expectation: "That it was expected", importance: 3, user_id: u2, sprint_id: s1, shared: true, resolved: false
c5 = Card.create sentiment: 2, incident: "This didn't happened", feeling: "I don't know", expectation: "I don't know", importance: 7, user_id: u3, sprint_id: s2, shared: false, resolved: false

puts "Created #{ Card.all.length } cards."

Sprint.destroy_all

s1 = Sprint.create status: true, start: "2018-02-01", end: "2018-02-14", workspace_id: w1
s2 = Sprint.create status: false, start: "2018-02-15", end: "2018-02-28", workspace_id: w2

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

puts "Created #{ Comment.all.length } comments."

Workspace.destroy_all

w1 = Workspace.create name: "Relationship Review", access_token: "abcd1234"
w2 = Workspace.create name: "Personal Reflection", access_token: "pewpewpew"

puts "Created #{ Workspace.all.length } workspaces."
