require 'rails_helper'

feature "user can view index page of all their conversations" do
  let!(:dom){User.create(email: "dom@bob.com", password: "aaaaaaaa", name: "Dom")}
  let!(:bob){User.create(email: "bob@bob.com", password: "aaaaaaaa", name: "Bob")}
  let!(:conversation){Conversation.create(creator_id: 1, joiner_id: 2)}
  let!(:bob_message){Message.create(sender_id: 2, body: "pineapple", conversation_id: 1)}

  scenario "user can click on Inbox in the nav bar to see list of conversations" do
    visit '/login'
    within('form') do
      fill_in 'Password', with:"aaaaaaaa"
      fill_in 'Email', with:"dom@bob.com"
    end
    click_button 'Login'
    click_link 'Inbox'
    click_link 'pineapple'
    expect(page).to have_content("pineapple")
  end
end
