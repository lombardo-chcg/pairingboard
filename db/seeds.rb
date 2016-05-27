# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
user = User.create(email: "liz@bob", password: "aaaaaaaa", name: "liz", phone_number: "1234567890", current_phase: 4)
user2 = User.create(email: "fronk@bob", password: "aaaaaaaa", name: "fronk", phone_number: "1234567890", current_phase: 3)
user3 = User.create(email: "dom@bob", password: "mmmmmmmm", name: "dom", phone_number: "91234567", current_phase: 2)


user.offerings.create(offering_date: "28-05-2016", start_time: "9:00")
user.offerings.create(offering_date: "28-05-2016", start_time: "9:30")
user.offerings.create(offering_date: "28-05-2016", start_time: "10:00")
user.offerings.create(offering_date: "28-05-2016", start_time: "10:30")
user.offerings.create(offering_date: "28-05-2016", start_time: "11:00")
user.offerings.create(offering_date: "28-05-2016", start_time: "11:30")
user.offerings.create(offering_date: "28-05-2016", start_time: "12:00")
user.offerings.create(offering_date: "28-05-2016", start_time: "12:30")
user.offerings.create(offering_date: "28-05-2016", start_time: "1:00")


# Conversation.create()
# Conversation.create()

# Converser.create(user_id: 1, conversation_id: 1)
# Converser.create(user_id: 2, conversation_id: 1)
# Converser.create(user_id:1, conversation_id:2)
# Converser.create(user_id:3, conversation_id:1)

# Message.create(conversation_id: 1, body: "Hello", sender_id: 1)
# Message.create(conversation_id: 1, body: "HAIIIII", sender_id: 2)
# Message.create(conversation_id: 2, body: "HEY GURL", sender_id: 3)
