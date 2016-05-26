require 'rails_helper'

feature "user can view index page of all their conversations" do
  let!(:dom){User.create(email: "dom@bob.com", password: "aaaaaaaa", name: "Dom")}
  let!(:bob){User.create(email: "bob@bob.com", password: "aaaaaaaa", name: "Bob")}
  let!(:conversation){Conversation.create()}
  let!(:dom_talk){Converser.create(user_id: 1, conversation_id: 1)}
  let!(:bob_talk){Converser.create(user_id: 1, conversation_id: 2)}
  let!(:bob_message){Message.create(sender_id: 2, body: "pineapple", conversation_id: 1)}

  scenario "user can click on Inbox in the nav bar to see list of conversations" do
    visit '/user/1/conversations'
    expect(page).to have_content("pineapple")
  end
end
