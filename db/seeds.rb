# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


Workspace.destroy_all

w1 = Workspace.create name: "Relationship Review", access_token: "abcd1234"
w2 = Workspace.create name: "Personal Reflection", access_token: "pewpewpew"

puts "Created #{ Workspace.all.length } workspaces."


User.destroy_all

u1 = User.create name:'u1', email: 'u1@mail.com', password: 'chicken', relationship_status: 1
u2 = User.create name:'u2', email: 'u2@mail.com', password: 'chicken', relationship_status: 1
u3 = User.create name:'u3', email: 'u3@mail.com', password: 'chicken', relationship_status: 0

puts "Created #{ User.all.length } users."


Sprint.destroy_all

s1 = Sprint.create status: true, start: "2018-02-01", end: "2018-02-14", workspace: w1
s2 = Sprint.create status: false, start: "2018-02-15", end: "2018-02-28", workspace: w2

puts "Created #{ Sprint.all.length } sprints."


Card.destroy_all

c1 = Card.create sentiment: 0, incident: "This happened", feeling: "okay", expectation: "That it was expected", importance: 6, user: u1, sprint: s1, shared: true, resolved: true
c2 = Card.create sentiment: 1, incident: "This didn't happened", feeling: "meh", expectation: "That it should happen differently", importance: 8, user: u1, sprint: s1, shared: true, resolved: false
c3 = Card.create sentiment: 0, incident: "This happened to me", feeling: "great", expectation: "That it was expected", importance: 5, user: u1, sprint: s1, shared: true, resolved: false
c4 = Card.create sentiment: 1, incident: "This happened just now!", feeling: "awesome", expectation: "That it was expected", importance: 3, user: u1, sprint: s1, shared: true, resolved: false
c5 = Card.create sentiment: 2, incident: "This happened???", feeling: "I don't know", expectation: "I don't know", importance: 7, user: u1, sprint: s1, shared: true, resolved: false
c6 = Card.create sentiment: 2, incident: "Not sure", feeling: "off", expectation: "Something else", importance: 5, user: u1, sprint: s1, shared: true, resolved: false
c7 = Card.create sentiment: 2, incident: "Shrug", feeling: "eep", expectation: "I don't know", importance: 2, user: u1, sprint: s1, shared: true, resolved: false
c8 = Card.create sentiment: 1, incident: "This kind of happened", feeling: "a little bit meh", expectation: "anything but this", importance: 10, user: u1, sprint: s1, shared: true, resolved: true
c9 = Card.create sentiment: 0, incident: "This really happened", feeling: "I don't know", expectation: "I don't know", importance: 6, user: u1, sprint: s1, shared: true, resolved: true
c10 = Card.create sentiment: 0, incident: "This is what happened", feeling: "Amazing", expectation: "Not this obviously", importance: 9, user: u2, sprint: s1, shared: true, resolved: true


puts "Created #{ Card.all.length } cards."


Task.destroy_all

t1 = Task.create todo: "eat", user: u1, card: c1
t2 = Task.create todo: "sleep", user: u1, card: c2
t3 = Task.create todo: "drink", user: u2, card: c1
t4 = Task.create todo: "code", user: u2, card: c3

puts "Created #{ Task.all.length } tasks."


Comment.destroy_all

m1 = Comment.create title: "hi", description: "this is a comment", user: u1, card: c1
m2 = Comment.create title: "bye", description: "this is not a comment", user: u1, card: c3
m3 = Comment.create title: "oops", description: "this is an accidental comment", user: u2, card: c3

puts "Created #{ Comment.all.length } comments."

w1.users << u1 << u2
w2.users << u3
